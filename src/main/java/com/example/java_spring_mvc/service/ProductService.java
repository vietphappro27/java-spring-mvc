package com.example.java_spring_mvc.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.java_spring_mvc.domain.Cart;
import com.example.java_spring_mvc.domain.CartDetail;
import com.example.java_spring_mvc.domain.Product;
import com.example.java_spring_mvc.domain.ProductItem;
import com.example.java_spring_mvc.domain.Size;
import com.example.java_spring_mvc.domain.User;
import com.example.java_spring_mvc.repository.CartDetailRepository;
import com.example.java_spring_mvc.repository.CartRepository;
import com.example.java_spring_mvc.repository.ProductItemRepository;
import com.example.java_spring_mvc.repository.ProductRepository;
import com.example.java_spring_mvc.repository.SizeRepository;
import com.example.java_spring_mvc.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class ProductService {

    private ProductRepository productRepository;
    private SizeRepository sizeRepository;
    private ProductItemRepository productItemRepository;
    private CartRepository cartRepository;
    private CartDetailRepository cartDetailRepository;
    private UserRepository userRepository;

    public ProductService(ProductRepository productRepository, SizeRepository sizeRepository,
            ProductItemRepository productItemRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserRepository userRepository) {
        this.productRepository = productRepository;
        this.sizeRepository = sizeRepository;
        this.productItemRepository = productItemRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userRepository = userRepository;
    }

    public void handleSaveProduct(Product product) {
        List<ProductItem> productItems = product.getProductItems();
        // For updates
        if (product.getId() > 0) {
            // This is an update operation
            Product savedProduct = this.productRepository.save(product);
            return;
        }
        // For create
        if (productItems == null || productItems.isEmpty()) {
            throw new IllegalArgumentException("Product must have at least one ProductItem.");
        }
        // Save new product with its items
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

    public List<Size> getAllSize() {
        return this.sizeRepository.findAll();
    }

    public List<Product> getAllProduct() {
        return this.productRepository.findAll();
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

    public List<Size> getSizesByProductId(long productId) {
        List<ProductItem> productItems = this.productItemRepository
                .findByProduct(this.productRepository.findById(productId));
        List<Size> sizes = new ArrayList<>();
        for (ProductItem item : productItems) {
            sizes.add(item.getSize());
        }
        return sizes;
    }

    public void handleDeleteProduct(Product product) {
        List<ProductItem> productItems = this.productItemRepository.findByProduct(product);
        for (ProductItem item : productItems) {
            this.productItemRepository.deleteById(item.getId());
        }
        this.productRepository.delete(product);
    }

    public void handleAddProductToCart(String email, long productId, HttpSession session) {
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
            Product product = this.productRepository.findById(productId);
            if (product != null) {

                CartDetail cartDetail = this.cartDetailRepository.findByCartAndProduct(cart, product);
                if (cartDetail == null) {
                    // create cart detail
                    cartDetail = new CartDetail();
                    cartDetail.setCart(cart);
                    cartDetail.setProduct(product);
                    cartDetail.setQuantity(1);
                    // update cart
                    int sum = cart.getSum() + 1;
                    cart.setSum(sum);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", sum);
                } else {
                    // update cart detail
                    cartDetail.setQuantity(cartDetail.getQuantity() + 1);
                }
                cartDetail.setPrice(product.getPrice());
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
            Cart currentCart = cartDetail.getCart();
            this.cartDetailRepository.deleteById(cartDetailId);
            // update cart
            if (currentCart.getSum() > 1) {
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
}
