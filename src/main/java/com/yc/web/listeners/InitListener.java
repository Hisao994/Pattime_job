package com.yc.web.listeners;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.data.redis.core.ZSetOperations.TypedTuple;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.yc.bean.Job;
import com.yc.bean.Merchant_wantedjob;
import com.yc.biz.impl.JobBizImpl;
import com.yc.dao.RedisDao;
@Slf4j
@Component
public class InitListener implements ServletContextListener {
	private ApplicationContext ac;
	private JobBizImpl jobBizImpl;
	private ServletContext application;
	public List<Job> industryList;
	@Autowired
	RedisDao  redisDao;
	
	public void contextDestroyed(ServletContextEvent arg0) {
	}

	public void contextInitialized(ServletContextEvent sce) {

		application = sce.getServletContext();
		ac = WebApplicationContextUtils.getWebApplicationContext(application);
		 jobBizImpl = (JobBizImpl) ac.getBean("jobBizImpl");
		// 查出所有的行业
		 
		try {
			cache();
			//清空redis
			Set<TypedTuple<String>> set=redisDao.rank("JobRank",0,-1);
			for(TypedTuple<String> t:set){
				redisDao.delValue("JobRank", t.getValue());
			}
	
			List<Merchant_wantedjob> list=new ArrayList(); 
			application.setAttribute("rankList", list);
			log.info(industryList.toString());
		} catch (Exception e) {
			e.printStackTrace();
			log.error("系统初始化错误，详细信息如下：",e);
			log.error("系统退出，请检查再次部署。。。。。");
			System.exit(0);
		}

	}
	
	//缓存所有的工作信息
	public void cache(){
		industryList = jobBizImpl.getAllJob();
		application.removeAttribute("industryList");
		application.setAttribute("industryList", industryList);
	}

}
