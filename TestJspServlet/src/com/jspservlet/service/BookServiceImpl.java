package com.jspservlet.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.jspservlet.dao.BookDAOImlp;
import com.jspservlet.dao.CommonDAO;
import com.jspservlet.dto.BookDTO;

public class BookServiceImpl implements CommonService<BookDTO>{

	private CommonDAO<BookDTO> bookDao;
	
	public BookServiceImpl() {
		this.bookDao = new BookDAOImlp();
	}

	@Override
	public ArrayList<BookDTO> List() throws SQLException {
		return this.bookDao.list();
	}

	@Override
	public boolean Add(BookDTO data) throws SQLException {
		return this.bookDao.add(data);
	}

	@Override
	public boolean Update(BookDTO data) throws SQLException {
		return this.bookDao.update(data);
	}

	@Override
	public boolean Delete(BookDTO data) throws SQLException {
		return this.bookDao.delete(data);
	}

	@Override
	public BookDTO getDataById(int id) throws SQLException {
		return this.bookDao.getDataById(id);

	}

	@Override
	public boolean InUsed(int id) throws SQLException {
		return this.bookDao.InUsed(id);
	}
}
