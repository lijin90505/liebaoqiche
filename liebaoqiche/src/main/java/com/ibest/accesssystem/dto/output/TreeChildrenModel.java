package com.ibest.accesssystem.dto.output;

/**
 * 树子节点
 */
public class TreeChildrenModel {

	public String id;
	
    public String text; 
    
    public boolean checked;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}	
    
    
}
