package com.example.java_spring_mvc.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.example.java_spring_mvc.domain.Cart;
import com.example.java_spring_mvc.domain.CartDetail;
import com.example.java_spring_mvc.domain.Order;
import com.example.java_spring_mvc.domain.OrderDetail;
import com.example.java_spring_mvc.domain.Product;
import com.example.java_spring_mvc.domain.ProductItem;
import com.example.java_spring_mvc.domain.Product_;
import com.example.java_spring_mvc.domain.Size;
import com.example.java_spring_mvc.domain.User;
import com.example.java_spring_mvc.domain.dto.ProductCriterialDTO;
import com.example.java_spring_mvc.repository.CartDetailRepository;
import com.example.java_spring_mvc.repository.CartRepository;
import com.example.java_spring_mvc.repository.OrderDetailRepository;
import com.example.java_spring_mvc.repository.OrderRepository;
import com.example.java_spring_mvc.repository.ProductItemRepository;
import com.example.java_spring_mvc.repository.ProductRepository;
import com.example.java_spring_mvc.repository.SizeRepository;
import com.example.java_spring_mvc.repository.UserRepository;
import com.example.java_spring_mvc.service.specification.ProductSpecs;

import jakarta.servlet.http.HttpSession;

@Service
public class ProductService {

    private ProductRepository productRepository;
    private SizeRepository sizeRepository;
    private ProductItemRepository productItemRepository;
    private CartRepository cartRepository;
    private CartDetailRepository cartDetailRepository;
    private UserRepository userRepository;
    private OrderRepository orderRepository;
    private OrderDetailRepository orderDetailRepository;

    public ProductService(ProductRepository productRepository, SizeRepository sizeRepository,
            ProductItemRepository productItemRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserRepository userRepository,
            OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.productRepository = productRepository;
        this.sizeRepository = sizeRepository;
        this.productItemRepository = productItemRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userRepository = userRepository;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    // Save and update product
    public void handleSaveProduct(Product product) {
        // update product
        if (product.getId() > 0) {
            Product savedProduct = this.productRepository.save(product);
            return;
        }
        // create product
        List<ProductItem> productItems = product.getProductItems();
        if (productItems == null || productItems.isEmpty()) {
            throw new IllegalArgumentException("Product must have at least one ProductItem.");
        }
        Product savedProduct = this.productRepository.save(product);
        for (ProductItem item : productItems) {
            item.setProduct(savedProduct);
            item.setSold(0L);
            this.productItemRepository.save(item);
        }
    }

    public void deleteProductItem(long itemId) {
        if (this.productItemRepository.existsById(itemId)) {
            this.productItemRepository.deleteById(itemId);
        }
    }

    // all sizes in database
    public List<Size> getAllSize() {
        return this.sizeRepository.findAll();
    }

    private Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%");
    }

    public Page<Product> getAllProduct(Pageable pageable) {
        return this.productRepository.findAll(pageable);
    }

    public Page<Product> getAllProductWithSpec(Pageable pageable, ProductCriterialDTO productCriterialDTO) {
        if ((productCriterialDTO.getBrand() == null || !productCriterialDTO.getBrand().isPresent()) &&
                (productCriterialDTO.getCategory() == null || !productCriterialDTO.getCategory().isPresent()) &&
                (productCriterialDTO.getPrice() == null || !productCriterialDTO.getPrice().isPresent())) {
            return this.productRepository.findAll(pageable);
        }

        Specification<Product> combinedSpec = Specification.where(null);

        if (productCriterialDTO.getCategory() != null && productCriterialDTO.getCategory().isPresent()) {
            Specification<Product> categorySpec = ProductSpecs
                    .matchListCategory(productCriterialDTO.getCategory().get());
            combinedSpec = combinedSpec.and(categorySpec);
        }

        if (productCriterialDTO.getBrand() != null && productCriterialDTO.getBrand().isPresent()) {
            Specification<Product> brandSpec = ProductSpecs.matchListBrand(productCriterialDTO.getBrand().get());
            combinedSpec = combinedSpec.and(brandSpec);
        }

        if (productCriterialDTO.getPrice() != null && productCriterialDTO.getPrice().isPresent()) {
            List<String> prices = productCriterialDTO.getPrice().get();
            if (!prices.isEmpty()) {
                Specification<Product> priceSpec = null;

                for (String priceRange : prices) {
                    Specification<Product> currentPriceSpec = null;

                    switch (priceRange) {
                        case "3000plus":
                            currentPriceSpec = ProductSpecs.minPrice(3000000);
                            break;
                        case "2000-3000":
                            currentPriceSpec = ProductSpecs.matchPrice(2000000, 3000000);
                            break;
                        case "1000-2000":
                            currentPriceSpec = ProductSpecs.matchPrice(1000000, 2000000);
                            break;
                        case "below-1000":
                            currentPriceSpec = ProductSpecs.maxPrice(1000000);
                            break;
                    }

                    if (currentPriceSpec != null) {
                        if (priceSpec == null) {
                            priceSpec = currentPriceSpec;
                        } else {
                            priceSpec = priceSpec.or(currentPriceSpec);
                        }
                    }
                }

                if (priceSpec != null) {
                    combinedSpec = combinedSpec.and(priceSpec);
                }
            }
        }

        return this.productRepository.findAll(combinedSpec, pageable);
    }

    public Product getProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void updateProductItem(long itemId, long sizeId, long quantity) {
        ProductItem item = this.productItemRepository.findById(itemId);
        if (item != null) {
            Size size = this.sizeRepository.findById(sizeId);
            if (size != null) {
                item.setSize(size);
                item.setQuantity(quantity);
                this.productItemRepository.save(item);
            }
        }
    }

    public void addProductItem(long productId, long sizeId, long quantity) {
        Product product = this.productRepository.findById(productId);
        Size size = this.sizeRepository.findById(sizeId);
        if (product != null && size != null) {
            ProductItem newItem = new ProductItem();
            newItem.setProduct(product);
            newItem.setSize(size);
            newItem.setQuantity(quantity);
            newItem.setSold(0L);
            this.productItemRepository.save(newItem);
        }
    }

    public List<ProductItem> getProductItemsByProductId(long productId) {
        return this.productItemRepository.findByProduct(this.productRepository.findById(productId));
    }

    public ProductItem getProductItemByProductAndSize(Product product, Size size) {
        return this.productItemRepository.findByProductAndSize(product, size);
    }

    public List<Size> getSizesByProductId(long productId) {
        List<ProductItem> productItems = this.productItemRepository
                .findByProduct(this.productRepository.findById(productId));
        List<Size> sizes = new ArrayList<>();
        for (ProductItem item : productItems) {
            sizes.add(item.getSize());
        }
        return sizes;
    }

    public Size getSizeById(long sizeId) {
        return this.sizeRepository.findById(sizeId);
    }

    public void handleDeleteProduct(Product product) {
        List<ProductItem> productItems = this.productItemRepository.findByProduct(product);
        for (ProductItem item : productItems) {
            this.productItemRepository.deleteById(item.getId());
        }
        this.productRepository.delete(product);
    }

    public void handleAddProductItemToCart(String email, ProductItem productItem, long quantity, HttpSession session) {
        User user = this.userRepository.findByEmail(email);
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                // create cart
                cart = new Cart();
                cart.setUser(user);
                cart.setSum(0);
                cart = this.cartRepository.save(cart);
            }
            if (productItem != null) {
                CartDetail cartDetail = this.cartDetailRepository.findByCartAndProductItem(cart, productItem);
                if (cartDetail == null) {
                    cartDetail = new CartDetail();
                    cartDetail.setCart(cart);
                    cartDetail.setProductItem(productItem);
                    cartDetail.setQuantity(quantity);
                    // update cart
                    int sum = cart.getSum() + 1;
                    cart.setSum(sum);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", sum);
                } else {
                    cartDetail.setQuantity(cartDetail.getQuantity() + quantity);
                }
                // update cart detail
                cartDetail.setPrice(productItem.getProduct().getPrice());
                this.cartDetailRepository.save(cartDetail);
            }
        }
    }

    public Cart getCartByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {
        Optional<CartDetail> cartDetailOptional = this.cartDetailRepository.findById(cartDetailId);
        if (cartDetailOptional.isPresent()) {
            CartDetail cartDetail = cartDetailOptional.get();
            long quantity = cartDetail.getQuantity();
            Cart currentCart = cartDetail.getCart();
            this.cartDetailRepository.deleteById(cartDetailId);
            // update cart
            if (currentCart.getSum() > quantity) {
                int sum = currentCart.getSum() - 1;
                currentCart.setSum(sum);
                session.setAttribute("sum", sum);
                this.cartRepository.save(currentCart);
            } else {
                this.cartRepository.deleteById(currentCart.getId());
                session.setAttribute("sum", 0);
            }
        }
    }

    // Update cart before checkout
    public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cartDetailOptional = this.cartDetailRepository.findById(cartDetail.getId());
            if (cartDetailOptional.isPresent()) {
                CartDetail currentCartDetail = cartDetailOptional.get();
                currentCartDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(currentCartDetail);
            }
        }
    }

    // Place order
    public void handlePlaceOrder(User user, Order order, HttpSession session) {
        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();
            if (cartDetails != null) {
                order.setUser(user);
                order.setOrderDate(LocalDate.now());
                order.setStatus("PENDING");
                double totalPrice = 0;

                for (CartDetail cartDetail : cartDetails) {
                    totalPrice += cartDetail.getPrice() * cartDetail.getQuantity();
                }
                order.setTotalPrice(totalPrice);
                this.orderRepository.save(order);
                // save order detail
                for (CartDetail cartDetail : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProductItem(cartDetail.getProductItem());
                    orderDetail.setQuantity(cartDetail.getQuantity());
                    orderDetail.setPrice(cartDetail.getPrice());
                    this.orderDetailRepository.save(orderDetail);
                }
                // delete and update cart
                for (CartDetail item : cartDetails) {
                    this.cartDetailRepository.deleteById(item.getId());
                }
                this.cartRepository.deleteById(cart.getId());
                // update session
                session.setAttribute("sum", 0);
            }
        }
    }

    public int countProduct() {
        return this.productRepository.findAll().size();
    }

}
