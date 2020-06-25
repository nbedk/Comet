package com.aerors.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.comet4j.core.CometContext;
import org.comet4j.core.CometEngine;
 
public class TestComet implements ServletContextListener { 

    private static final String CHANNEL = "test";
    private static int number1 = 0 ;

    public void contextInitialized(ServletContextEvent arg0) {
        CometContext cc = CometContext.getInstance();
        cc.registChannel(CHANNEL);// 注册应用的channel

        Thread helloAppModule = new Thread(new HelloAppModule(),
                "Sender App Module");
        // 是否启动
        helloAppModule.setDaemon(true);
        // 启动线程
        helloAppModule.start();
    }

    class HelloAppModule implements Runnable {
        public void run() {
            while (true) {
                try {
                    // 睡眠时间
                    Thread.sleep(2000);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                CometEngine engine = CometContext.getInstance().getEngine();
                // 获取消息内容
                long l = Runtime.getRuntime().freeMemory();
                // 开始发送         
                engine.sendToAll(CHANNEL, number1++);
            }
        }
    }

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}
}