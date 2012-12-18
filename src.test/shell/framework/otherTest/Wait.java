package shell.framework.otherTest;

/**
 * Created with IntelliJ IDEA.
 * User: yangchangming
 * Date: 12-12-12
 * Time: 下午9:05
 * To change this template use File | Settings | File Templates.
 */

public class Wait extends Thread{
    @Override
    public void run(){
        System.out.println("start");
        synchronized (this){
            try{
                this.wait();
            }catch (InterruptedException e){
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args){
        Thread thread = new Wait();
        thread.start();

        try{
            sleep(2000);
        }catch (InterruptedException e){
            e.printStackTrace();
        }
        synchronized (thread){
            System.out.println("wait() will release the lock.");
            thread.notify();
        }
    }





}
