<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- CSS Styles for form 5695 -->
	<xsl:template name="IRS5695Style">

    .styIRS5695Info {
      font-size:7.5pt;
      padding-top:0.5mm;
    }
    
    .styIRS5695Num {
      float:left;
      padding-top:1.5mm;
      padding-left:2mm;
      font-size:7.5pt;
      font-weight:bold;
    }
    
    .styIRS5695LB {
      float:left;
      padding-left:3mm;
      padding-top:1.5mm;
      font-size:7.5pt;
    }
	.styIRS5695LineItem {  /* Line Item */
		width: 187mm;
		height: 4mm;
		float: none; clear: both;
    }
    .styIRS5695Dots { /* Spacer dots */
		font-weight:bold;
		text-align:right;
		padding-right:3.3mm;
		letter-spacing:3.3mm;
		float:right;clear:none;
		skiplink:display:none;
	}
    .styIRS5695LNLeftNumBox{ /* Double digit item number to the left of the page */
		width:6mm;
		height:100%;
		font-weight:bold;
		padding-top: 3px; 
		padding-right:6px;
		padding-left: 0mm;
		float:left; clear:none;
		text-align:right;
		font-size:8pt;
	}
	.styIRS5695LNDesc{ /* Line item description */
		width:138mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		padding-left:3mm;
		border-style: solid;
		border-width:0px 0px 0px 0px;
		border-color:#FF0000;
		font-size:8.5pt;
		float:left; clear: none;
	}
	
	.styIRS5695TableCell {   /* Table Cell for Letter */
		padding-left:5px;
		color: black;
		border-color:black;
		border-style:solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}
	.styIRS5695TableCellHeader {   /* Table Cell Header */
		color: black;
		text-align: center;	
		border-color:black;
		border-style:solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}
	.styIRS5695CleanDiv {
		padding:0px 0px 0px 0px;
		border-width:0px 0px 0px 0px;
		border-style:solid;
		border-color:black;
		float:left;
		font-size:7pt;
		font-family:arial;
	}

</xsl:template>
</xsl:stylesheet>
