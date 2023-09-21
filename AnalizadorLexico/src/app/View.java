package app;

import javax.swing.JFrame;
import javax.swing.JPanel;
import java.awt.BorderLayout;
import javax.swing.JTextPane;
import java.awt.TextArea;
import java.awt.Button;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Color;
import java.awt.Font;
import javax.swing.JButton;
import javax.swing.JTextArea;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.JLabel;
import javax.swing.SwingConstants;
import javax.swing.JTextField;
import javax.swing.UIManager;

public class View {

	public JFrame frame;

	/**
	 * Create the application.
	 */
	public View() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 997, 706);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		JPanel panel = new JPanel();
		frame.getContentPane().add(panel, BorderLayout.CENTER);
		panel.setLayout(null);
		
		JTextArea inputTextArea = new JTextArea();
		inputTextArea.setBounds(10, 39, 404, 592);
		panel.add(inputTextArea);
		
		JTextArea outputTextArea = new JTextArea();
		outputTextArea.setBounds(565, 39, 404, 592);
		panel.add(outputTextArea);
		outputTextArea.setEditable(false);
		
		JButton btnNewButton = new JButton("Compilar");
		btnNewButton.setForeground(UIManager.getColor("Button.foreground"));
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				outputTextArea.append("Resultado compilacion \n");
			}
		});
		btnNewButton.setFont(new Font("Calibri", Font.PLAIN, 18));
		btnNewButton.setBackground(UIManager.getColor("Button.background"));
		btnNewButton.setBounds(424, 275, 131, 44);
		panel.add(btnNewButton);
		
		JLabel lblNewLabel = new JLabel("Entrada");
		lblNewLabel.setVerticalAlignment(SwingConstants.BOTTOM);
		lblNewLabel.setFont(new Font("Calibri", Font.ITALIC, 20));
		lblNewLabel.setForeground(new Color(0, 0, 0));
		lblNewLabel.setBounds(10, 10, 104, 24);
		panel.add(lblNewLabel);
		
		JLabel lblResultadoCompilacin = new JLabel("Resultado compilación");
		lblResultadoCompilacin.setVerticalAlignment(SwingConstants.BOTTOM);
		lblResultadoCompilacin.setForeground(new Color(0, 0, 0));
		lblResultadoCompilacin.setFont(new Font("Calibri", Font.ITALIC, 20));
		lblResultadoCompilacin.setBounds(565, 10, 231, 24);
		panel.add(lblResultadoCompilacin);
		
		
		
		JMenuBar menuBar = new JMenuBar();
		frame.setJMenuBar(menuBar);
		
		JMenu mnNewMenu = new JMenu("Archivo");
		mnNewMenu.setBackground(new Color(192, 192, 192));
		menuBar.add(mnNewMenu);
		
		JMenuItem mntmNewMenuItem = new JMenuItem("Abrir...");
		mntmNewMenuItem.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//TODO: Implementar que al abrir un archivo, el contenido se carge en el TextArea
				inputTextArea.append("Contenido del archivo... \n");
			}
		});
		mntmNewMenuItem.setBackground(new Color(211, 211, 211));
		mnNewMenu.add(mntmNewMenuItem);
		
	}
}
