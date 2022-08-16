package com.codingdojo.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.bookclub.models.Book;
import com.codingdojo.bookclub.repositories.BookRepository;

@Service
public class BookService {
	private final BookRepository bookRepository;

	public BookService(BookRepository bookRepository) {
		this.bookRepository = bookRepository;
	}

	// returns all the books
	public List<Book> allBooks() {
		return bookRepository.findAll();
	}

	// creates a book
	public Book createBook(Book b) {
		return bookRepository.save(b);
	}

	// retrieves a book
	public Book findBook(Long id) {
		Optional<Book> optionalBook = bookRepository.findById(id);
		if (optionalBook.isPresent()) {
			return optionalBook.get();
		} else {
			return null;
		}
	}

	// delete book by id
	public void deleteBook(Long id) {
		bookRepository.deleteById(id);
	}

	// update a book
	public Book updateBook(Long id, String title, String author, String setMy_thoughts) {
		Book updatedBook = findBook(id);
		updatedBook.setTitle(title);
		updatedBook.setAuthor(author);
		updatedBook.setMy_thoughts(setMy_thoughts);
		return bookRepository.save(updatedBook);
	}
}
