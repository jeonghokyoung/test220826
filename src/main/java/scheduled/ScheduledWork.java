package scheduled;

import org.springframework.stereotype.Component;

@Component
public class ScheduledWork {
	public void work1() {
		System.out.println("5초마다 작업 실행");
	}
}
