package com.codingdojo.bookclub.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.bookclub.models.Book;
import com.codingdojo.bookclub.models.User;
import com.codingdojo.bookclub.services.BookService;
import com.codingdojo.bookclub.services.UserService;

@Controller
public class BookController {
	@Autowired
	private UserService userServ;

	@Autowired
	private BookService bookServ;

	@GetMapping("/books")
	public String books(HttpSession session, Model model) {
		Long userId = (Long) session.getAttribute("user_id");
		if (userId == null) {
			return "redirect:/login";
		} else {
			User currentUser = userServ.findOneUser(userId);
			model.addAttribute("currentUser", currentUser);

			List<Book> allBooks = bookServ.allBooks();
			model.addAttribute("books", allBooks);

			return "Books.jsp";
		}
	}

	@GetMapping("/books/new")
	public String newBook(HttpSession session, @ModelAttribute("book") Book book) {
		Long userId = (Long) session.getAttribute("user_id");
		if (userId == null) {
			return "redirect:/login";
		} else {
			return "AddBook.jsp";
		}
	}

	@PostMapping("/books/new")
	public String createBook(HttpSession session, @Valid @ModelAttribute("book") Book book, BindingResult result) {
		Long userId = (Long) session.getAttribute("user_id");
		if (userId == null) {
			return "redirect:/login";
		} else {
			if (result.hasErrors()) {
				return "AddBook.jsp";
			} else {
				User newUser = userServ.findOneUser(userId);
				book.setUser(newUser);
				bookServ.createBook(book);
				return "redirect:/books";
			}
		}
	}

	@GetMapping("/books/{id}")
	public String showBook(@PathVariable Long id, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("user_id");
		Book b = bookServ.findBook(id);
		model.addAttribute("book", b);
		model.addAttribute("userId", userId);
		return "ShowBook.jsp";
	}

	@GetMapping("/books/{id}/edit")
	public String editBook(@ModelAttribute("book") Book book, @PathVariable Long id, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("user_id");
		Book b = bookServ.findBook(id);
		User bUser = b.getUser();
		if (bUser == null) {
			return "redirect:/books";
		}
		Long x = bUser.getId();
		if (userId - x == 0) {
			model.addAttribute("book", b);
			return "EditBook.jsp";
		} else {
			return "redirect:/books";
		}

	}

	@PostMapping("/book/{id}/edit/submit")
	public String submitEditBook(@Valid @ModelAttribute("book") Book book, BindingResult result, HttpSession session,
			@PathVariable Long id) {
		Long userId = (Long) session.getAttribute("user_id");
		if (userId == null) {
			return "redirect:/login";
		} else {
			if (result.hasErrors()) {
				return "EditBook.jsp";
			} else {
				bookServ.updateBook(id, book.getTitle(), book.getAuthor(), book.getMy_thoughts());
				return "redirect:/books";
			}
		}
	}
}
