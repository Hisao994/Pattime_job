package com.yc.biz;

import java.util.List;

import com.yc.bean.Applyinfo;

public interface ApplyinfoBiz {
	
	
	/**
	 * 根据条件某个的信息
	 * 
	 * @param house
	 * @return
	 */
	public List<Applyinfo> selectJobWithApply(Applyinfo applyinfo);
	/**
	 * 根据条件某个的信息
	 * 
	 * @param house
	 * @return
	 */
	public List<Applyinfo> getApplyinfo(Applyinfo applyinfo);

	/**
	 * 查询所有的兼职信息
	 * 
	 * @return
	 */
	public List<Applyinfo> getAllApplyinfo();

	/**
	 * 添加房子
	 * 
	 * @param house
	 * @return
	 */
	public boolean saveApplyinfo(Applyinfo applyinfo);

	/**
	 * 删除
	 * 
	 * @param house
	 * @return
	 */
	public boolean delApplyinfo(Applyinfo applyinfo);
	/**
	 * 更新
	 * 
	 * @param house
	 * @return
	 */
	public boolean updataApplyinfo(Applyinfo applyinfo);

	/**
	 * 查询学生列表
	 * 
	 * @param applyinfo
	 * @return
	 */
	public List<Applyinfo> seleStudentLsit(Applyinfo applyinfo);

}
