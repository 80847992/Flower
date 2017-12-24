package com.flower.interceptor;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

/**
 * 去掉首尾空格
 * @author Administrator
 *
 */
@SuppressWarnings("serial")
public class TrimInterceptor implements Interceptor {

	@Autowired
	protected HttpServletRequest request;
	
	@Autowired
	protected HttpSession session;
	
	@Override
	public void destroy() {

	}

	@Override
	public void init() {
		
	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		//System.out.println("去掉首尾空格");
		Map<String, Object> parameters = invocation.getInvocationContext().getParameters();
        Set entrySet = parameters.entrySet();
        String[] strings = null;
        String[] values = null;
        int strLength = 0;
        for (Iterator it = entrySet.iterator(); it.hasNext();) {
            Entry entry = (Entry) it.next();
            Object key = entry.getKey();
            Object value = entry.getValue();

            if (value instanceof String[]) {
            values = (String[]) value;//类型转换
            strLength = values.length;
            strings = new String[strLength];
                for (int i = 0; i < strLength; i++) {
                    strings[i] = values[i].trim();
                }

                parameters.put((String) key, strings);
            }
        }
        invocation.getInvocationContext().setParameters(parameters);
        return invocation.invoke();
	}

}
