package com.vanchuyen.dao;

import java.util.ArrayList;

public interface DAOInterface<T, A> {
	
	public ArrayList<T> selectAll();
	
	public T selectById(A id);
	
	public int insert(T t);
	
	public int insertAll(ArrayList<T> arr);
	
	public int delete(T t);
	
	public int deleteAll(ArrayList<T> arr);
	
	public int update(T t);
	
}
