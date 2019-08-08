<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rmca="urn:customs.ru:Information:CustomsDocuments:ResponseMCA:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0">
	<!-- Версия 4.7.0.0 от 25.02.2009.  -->
		<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<!--xsl:variable name="ColumnSpec" select="rmca:DocumentBody/rmca:Table/rmca:ColumnSpec"/-->
	<xsl:variable name="ColumnSpec" select="rmca:ResponseMCA/rmca:DocumentBody/rmca:Table/rmca:ColumnSpec"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="rmca:DocumentBody/rmca:TextSection">
		<xsl:if test="rmca:SectionName">
			<h3 align="left">
				<xsl:value-of select="rmca:SectionName"/>
			</h3>
		</xsl:if>
		<xsl:for-each select="rmca:TextPara">
			<p align="left" class="{../rmca:Style}">
				<xsl:value-of select="."/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			</p>
		</xsl:for-each>
	</xsl:template>
	
	
	<xsl:template match="rmca:DocumentBody/rmca:Table">

		<xsl:if test="rmca:TableName">
			<h4 align="left">
				<!--<xsl:value-of select="rmca:TableName"/>-->
				<xsl:value-of select="rmca:ShortTableName"/><br/>
			<a class="tooltip" href="javascript:undefined">
				<!-- сделано по примеру http://css-tricks.ru/Articles/Details/EasyCSSTooltip -->
				Описание : 
				<span><xsl:value-of select="rmca:TableName"/></span>
			</a>
			</h4>
		</xsl:if>
		<table style="width:100%;" cellpadding="0" cellspacing="0" border="1">
				<xsl:apply-templates select="rmca:TableHeadRow"/>
				<xsl:apply-templates select="rmca:TableBodyRow"/>
				<xsl:apply-templates select="rmca:TableFootRow"/>
			
		</table>
	</xsl:template>

	<xsl:template match="rmca:TableBodyRow | rmca:TableHeadRow | rmca:TableFootRow">
		<tr>
			<xsl:choose>
				<xsl:when test="rmca:EntryCell">
					<xsl:apply-templates select="rmca:EntryCell"/>
				</xsl:when>
				<xsl:when test="rmca:TableCell">
					<xsl:apply-templates select="rmca:TableCell"/>
				</xsl:when>
			</xsl:choose>
		</tr>
	</xsl:template>

	<xsl:template match="rmca:TableCell">
		<td align="{rmca:Align}" valign="{rmca:Valign}" colspan="{rmca:Morecols}" rowspan="{rmca:Morerows}" border="1">
			<xsl:choose>
				<xsl:when test="(position()=1) and (rmca:TextPara = ../rmca:GoodNum)"><!-- Комментарий разработчиков АИСТ: если первая ячейка и число в ней совпадает с номером товара -->
				    <a class="goodnum">
						<xsl:attribute name="href">javascript:try{ window.external.goodclicked('<xsl:value-of select="rmca:TextPara"/>'); }catch(e){}</xsl:attribute>
						<xsl:for-each select="rmca:TextPara">
							<p class="{../rmca:Style}">
								<xsl:value-of select="."/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</p>
						</xsl:for-each>
				    </a> 
				</xsl:when>					
				<xsl:otherwise>
					<xsl:for-each select="rmca:TextPara">
						<p class="{../rmca:Style}">
							<xsl:value-of select="."/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</p>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</td>
	</xsl:template>


	<xsl:template match="rmca:EntryCell">
		<td align="{rmca:Align}" valign="{rmca:Valign}" colspan="{rmca:Morecols}" rowspan="{rmca:Morerows}">
			<table style="width:100%;" cellpadding="0" cellspacing="0" border="1">
				<tbody>
					<xsl:for-each select="rmca:EntryRow">
						<tr>
						        <xsl:for-each select="rmca:TableCell">
								<xsl:apply-templates select="."/></xsl:for-each>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</td>	
	</xsl:template>
	
	
	<xsl:template match="rmca:ResponseMCA">	
		<xsl:param name="k" select="1"/>
		<html>
			<head>
				<title>
				<xsl:value-of select="rmca:DocumentHead/cat_ru:PrDocumentName"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:text>№ </xsl:text>
				<xsl:value-of select="rmca:DocumentHead/cat_ru:PrDocumentNumber"/>
				<xsl:text> от </xsl:text>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="rmca:DocumentHead/cat_ru:PrDocumentDate"/>
				</xsl:call-template>
					
				</title>
				<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8"/>
				<style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
							
						div.page {
							width: {210*$k}mm;
							height: {297*$k}mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid 1pt #000000;
							}
						
						td {
							font-family:Courier;
							}
						
						.normal{
							font-weight: normal;
							font-family:Courier;
							}
							
						.bold{
							font-weight: bold;
							font-family:Courier;
							}
						
						.italic{
							font-style: italic;
							font-family:Courier;
							}
							
a.tooltip span {
	display			: none; 
	padding			: 2px 3px; 
	margin-left		: 8px; 
	width			: 50%;
}
a.tooltip:hover {
	background		: #ffffff;	/*необходимо для IE6*/
	text-decoration	: none;
}
a.tooltip:hover span {
	display			: inline; 
	position		: absolute; 
	background		: #ffffff; 
	border			: 2px solid #aaaaaa; 
	color			: #4c4c4c;
    font-style: normal;
}						
h4{
    font-style: italic;
}
a.goodnum {
	text-decoration	: none;
/*	background	: #eee;  */
	color			: #000;
	font-weight: bold;
	font-family: Times;
}						
					</style>
			</head>
			<body>
				<div class="page">
					<xsl:if test="(rmca:DocumentHead/rmca:VisibleFlag = 'true' or rmca:DocumentHead/rmca:VisibleFlag = '1') or (not(//rmca:DocumentHead/rmca:VisibleFlag))">
					<h2>
						<xsl:value-of select="rmca:DocumentHead/cat_ru:PrDocumentName"/>
					</h2>
					<p>
						<xsl:text>№ </xsl:text>
						<xsl:value-of select="rmca:DocumentHead/cat_ru:PrDocumentNumber"/>
						<xsl:text> от </xsl:text>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="rmca:DocumentHead/cat_ru:PrDocumentDate"/>
						</xsl:call-template>
					</p>
					<xsl:if test="rmca:DocumentHead/rmca:OrganizationName">
						<p>
							<xsl:text>Выдан: </xsl:text>
							<xsl:value-of select="rmca:DocumentHead/rmca:OrganizationName"/>
						</p>
					</xsl:if>
					</xsl:if>
					<xsl:apply-templates select="rmca:DocumentBody/rmca:TextSection | rmca:DocumentBody/rmca:Table"/>
						<table style="width:100%;" border="0">
						<tbody>
							<xsl:for-each select="rmca:DocumentSign">
							<tr>
								<td style="width:40%;" align="right">	
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
									</xsl:call-template>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
								<td style="width:25%;" align="left"><xsl:value-of select="cat_ru:PersonPost"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
								<td style="width:10%;" align="right"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
								<td style="width:25%;" align="left"><xsl:value-of select="cat_ru:PersonSurname"/><xsl:text> </xsl:text><xsl:value-of select="cat_ru:PersonName"/><xsl:text> </xsl:text><xsl:value-of select="cat_ru:PersonMiddleName"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
								
							</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
