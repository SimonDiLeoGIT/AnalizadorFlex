package app;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;

import java.awt.BorderLayout;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.Reader;
import java.io.StringReader;
import java.util.List;
import java.awt.event.ActionEvent;
import java.awt.Color;
import java.awt.Cursor;
import java.awt.Font;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JTextArea;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JLabel;
import javax.swing.SwingConstants;
import javax.swing.UIManager;
import javax.swing.ScrollPaneConstants;

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
		
		JScrollPane scrollPane_1 = new JScrollPane();
		scrollPane_1.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);
		scrollPane_1.setBounds(10, 39, 404, 592);
		panel.add(scrollPane_1);
		JTextArea inputTextArea = new JTextArea();
		scrollPane_1.setViewportView(inputTextArea);
		inputTextArea.setWrapStyleWord(true);
		inputTextArea.setLineWrap(true);
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);
		scrollPane.setBounds(565, 39, 404, 592);
		panel.add(scrollPane);
		
		JTextArea outputTextArea = new JTextArea();
		scrollPane.setViewportView(outputTextArea);
		outputTextArea.setWrapStyleWord(true);
		outputTextArea.setLineWrap(true);
		outputTextArea.setEditable(false);

		
		JButton btnCompile = new JButton("Compilar");
		btnCompile.setForeground(new Color(255, 255, 255));
		btnCompile.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {					
					Reader reader = new StringReader(inputTextArea.getText());
					Lexico lexer = new Lexico(reader);
					lexer.next_token();

					outputTextArea.setText("");

					// Obtengo la lista de elementos que fue guardando el Lexico

					List<String> elements = lexer.getList(); // Obtiene la lista
					
					for (int i = 0; i < elements.size(); i++) {
						String element = elements.get(i);
						outputTextArea.append(element + "\n"); // Agrega el elemento y un salto de línea
					}

					lexer.vaciarLista();

				} catch(Exception error ) {
					JOptionPane.showMessageDialog(null, "Error", "Ocurrió un error al compilar el archivo.", JOptionPane.ERROR_MESSAGE);
				}
			}
		});
		btnCompile.setFont(new Font("Calibri", Font.PLAIN, 18));
		btnCompile.setBackground(new Color(0, 196, 0));
		btnCompile.setBounds(424, 275, 131, 44);
		btnCompile.setCursor(new Cursor(Cursor.HAND_CURSOR));
		panel.add(btnCompile);
		
		JLabel lblNewLabel = new JLabel("Entrada");
		lblNewLabel.setVerticalAlignment(SwingConstants.BOTTOM);
		lblNewLabel.setFont(new Font("Calibri", Font.ITALIC, 20));
		lblNewLabel.setForeground(new Color(0, 0, 0));
		lblNewLabel.setBounds(10, 10, 104, 24);
		panel.add(lblNewLabel);
		
		JLabel lblResultadoCompilacion = new JLabel("Resultado compilación");
		lblResultadoCompilacion.setVerticalAlignment(SwingConstants.BOTTOM);
		lblResultadoCompilacion.setForeground(new Color(0, 0, 0));
		lblResultadoCompilacion.setFont(new Font("Calibri", Font.ITALIC, 20));
		lblResultadoCompilacion.setBounds(565, 10, 231, 24);
		panel.add(lblResultadoCompilacion);
		
		JButton btnClear = new JButton("Limpiar");
		btnClear.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				inputTextArea.setText("");
				outputTextArea.setText("");
			}
		});
		btnClear.setForeground(new Color(255, 255, 255));
		btnClear.setBackground(new Color(248, 38, 38));
		btnClear.setFont(new Font("Calibri", Font.PLAIN, 18));
		btnClear.setBounds(424, 329, 131, 44);
		btnClear.setCursor(new Cursor(Cursor.HAND_CURSOR));
		panel.add(btnClear);
		
		
		
		JMenuBar menuBar = new JMenuBar();
		frame.setJMenuBar(menuBar);
		
		JMenu mnNewMenu = new JMenu("Archivo");
		mnNewMenu.setBackground(new Color(192, 192, 192));
		menuBar.add(mnNewMenu);
		
		JMenuItem mntmNewMenuItem = new JMenuItem("Cargar un archivo...");
		mntmNewMenuItem.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				JFileChooser fileChooser = new JFileChooser();
		        fileChooser.showOpenDialog(null);

		        File file = fileChooser.getSelectedFile();
		        if (file != null) {
		        	try {
		        		FileReader fileReader = new FileReader(file);
		        		BufferedReader bufferedReader = new BufferedReader(fileReader);
		                String linea;
		                while ((linea = bufferedReader.readLine()) != null) {
		                    inputTextArea.append(linea);
		                }

		                bufferedReader.close();
		        	} catch (Exception error){
		        		JOptionPane.showMessageDialog(null, "Error", "Error al abrir el archivo", JOptionPane.ERROR_MESSAGE);
		        	}
		        }
			}
		});
		mntmNewMenuItem.setBackground(new Color(211, 211, 211));
		mnNewMenu.add(mntmNewMenuItem);
		
	}
}
