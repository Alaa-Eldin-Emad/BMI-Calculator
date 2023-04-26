import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class SumOfDigits implements ActionListener {
    private static JPanel panel;
    private static JLabel label;
    private static JLabel label2;
    private static JTextField number;
    private static JTextField sum;
    private static JButton Submit;
    public static void main(String[] args) {
        JFrame frame = new JFrame();
        frame.setSize(500,500);

        panel = new JPanel();
        panel.setBackground(Color.orange.darker());
        frame.add(panel);
        panel.setLayout(null);
        label =new JLabel("Enter Number");
        label.setBounds(50,100,80,25);
        panel.add(label);
        number = new JTextField();
        number.setBounds(150,100,160,25);
        panel.add(number);
        label2 =new JLabel("Sum Of Digits");
        label2.setBounds(50,350,80,25);
        panel.add(label2);
        sum = new JTextField();
        sum.setBounds(150,350,160,25);
        panel.add(sum);
        Submit = new JButton("Submit");
        Submit.setBounds(175,225,100,40);
        panel.add(Submit);
        Submit.addActionListener(new SumOfDigits());
        frame.setVisible(true);

    }

    @Override
    public void actionPerformed(ActionEvent e) {
        int num =Integer.parseInt(number.getText());


        int x=0;
        while (num>0){
            x+=num%10;
            num/=10;
        }
        sum.setText(Integer.toString(x));
    }
}
