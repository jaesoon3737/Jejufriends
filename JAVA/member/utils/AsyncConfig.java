package jejufriends.member.utils;

import java.util.concurrent.Executor;

import javax.annotation.Resource;

import org.springframework.aop.interceptor.AsyncUncaughtExceptionHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.AsyncConfigurer;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

//email 보내는데 5초나걸려서 미리처리하긔
@Configuration
@EnableAsync
public class AsyncConfig implements AsyncConfigurer{
	
	private static int TASK_CORE_POOL_SIZE = 2;//기본쓰레드사이즈
	private static int TASK_MAX_POOL_SIZE = 4;//최대쓰레드사이즈
	private static int TASK_QUEUE_CAPACITY = 0;//Max쓰레드가 동작하는 경우 대기하는 큐 사이즈
	private static String EXECUTOR_BEAN_NAME = "executor";
	
	@Resource(name="executor")
	private ThreadPoolTaskExecutor executor;
	
	@Bean(name="executor")
	@Override
	public Executor getAsyncExecutor() {
		ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
		setExecutor(executor);
		return executor;
	}
	
	
	public void setExecutor(ThreadPoolTaskExecutor executor) {
		executor.setCorePoolSize(TASK_CORE_POOL_SIZE);
		executor.setMaxPoolSize(TASK_MAX_POOL_SIZE);
		executor.setQueueCapacity(TASK_QUEUE_CAPACITY);
		executor.setBeanName(EXECUTOR_BEAN_NAME);
		executor.initialize();
	}
	
	@Override
	public AsyncUncaughtExceptionHandler getAsyncUncaughtExceptionHandler() {
		return null;
	}
}
