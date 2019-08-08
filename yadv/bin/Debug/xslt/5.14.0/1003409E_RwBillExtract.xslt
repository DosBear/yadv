<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonLeafTypesCust:5.12.0" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.12.0" xmlns:rwbe="urn:customs.ru:Information:TransportDocuments:Railway:RwBillExtract:5.12.0">
<xsl:template match="rwbe:Consignor|rwbe:Consignee" mode="orgName">
	<xsl:if test="cat_ru:OrganizationName">
		<xsl:value-of select="cat_ru:OrganizationName"/>
	</xsl:if>
	<xsl:if test="cat_ru:ShortName and not(cat_ru:OrganizationName)">
		<xsl:value-of select="cat_ru:ShortName"/>
	</xsl:if>
</xsl:template>
<xsl:template match="cat_ru:Address">
	<xsl:for-each select="*">
		<xsl:value-of select="."/>
		<xsl:if test="position()!=last()">
			<xsl:text>, </xsl:text>
		</xsl:if>
	</xsl:for-each>
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
<xsl:template match="/">    
<html>
    <meta charset="UTF-8"/>
    <head>
        <style type="text/css">
			/* Параметры печати*/
			@page :right,
			@page :left,
			@page :first {
				margin: 5mm 5mm 5mm 6mm; /* Отступы для первой страницы */ 
			}
			
			html, body {
			  border: none;
			  margin: 0px;
			  padding: 0mm;
			  background: white;
			  outline: none;
			  font: 8px/1.5 'Times New Roman'
			  color: rgb(100,100,100);
			}
			
			body {
			  position: absolute;
			  bottom: 0;
			  right: 0;
			  left: 0;
			  top: 0;
			  overflow: hidden;
			}
			
			*{
				/*-webkit-padding-start: 0px;
				-webkit-margin-start: 0px;
				-moz-box-sizing: border-box;
				-webkit-box-sizing: border-box;
				-ms-box-sizing: border-box;
				box-sizing: border-box;*/
				outline: none;
			}
			
			.header {
				position: relative;
				width: 200mm;
				height: 13mm;
			}
			
			.header-title {
				left:0;
				top:0;
				width: 150mm;
				height: 13mm;
				border-bottom: 1px solid;
				line-height: 13mm;
				padding-left: 20px;
				font-size: 17px;
			}
			
			.header-right {
				left:155mm;
				top:0;
				width: 45mm;
				height: 13mm;
				border: 1px solid black;
				border-bottom: 1px solid;
				display: inline-block;
				float: right;
				margin-top: -49px;
			}
			
			.middle-block-first {
				width: 200mm;
				height: 61mm;
				font-size: 0;
				position: relative;
			}
			.middle-block-first-left {
				position: absolute;
				top: 0;
				width: 106mm;
				height: 100%;
			}
			
			.middle-block-first-right {
				position: absolute;
				left: 106mm;
				width: 94mm;
				height: 100%;
				border-right: 1px solid;
			}
			
			.sender-reciever-title-block {
				position: relative;
				height: 46mm;
				font-size: 0;
			}
			
			.sender-reciever-block-left-title {
				width: 46.4mm;
				height: 12.4mm;
				position: absolute;
				margin-left: -17mm;
				margin-top: 16.6mm;
				border-bottom: 0px solid;
				border-left: 1px solid;
				font-size: 17px;
				text-align: center;
				-webkit-transform: rotate(-90deg);
				-moz-transform: rotate(-90deg);
				-ms-transform: rotate(-90deg);
				-o-transform: rotate(-90deg);
				transform: rotate(-90deg);
				//filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3);
				-ms-filter: "progid:DXImageTransform.Microsoft.Matrix(M11=3.061616997868383e-16, M12=1, M21=-1, M22=3.061616997868383e-16, SizingMethod='auto expand')";
				filter: "progid:DXImageTransform.Microsoft.Matrix(M11=3.061616997868383e-16, M12=1, M21=-1, M22=3.061616997868383e-16, SizingMethod='auto expand')";
			}
			
			.sender-reciever-block {
				margin-left: 12mm;
				height: 46mm;
				border: 1px solid;
				border-top: none;
			}
			
			.sender {
				height: 23mm;
				border-bottom: 1px solid;
				position: relative;
			}
			
			.reciever {
				height: 23mm;
				position: relative;
			}
			
			.station-title {
				height: 10mm;
				border-bottom: 1px solid;
				position: relative;
			}
			
			.statement {
				height: 49mm;
				border-bottom: 0px solid;
			}
			
			.station-finish {
				height: 15mm;
				border-left: 1px solid;
				border-right: 1px solid;
				border-bottom: 1px solid;
				border-bottom: 1px solid;
				position: relative;
			}
			
			.table-legend {
				height: 7mm;
				border-bottom: 1px solid;
			}
			
			.middle-block-second {
				width: 200mm;
				font-size: 0;
				position: relative;
			}
			
			.border-stations {
				width: 65mm;
				height: 100%;
				border-left: 3px solid;
				border-bottom: 2px solid;
				position: absolute;
			}
			
			.main-table-block {
				width: 135mm;
				display: inline-block;
				border-right: 3px solid;
				position: relative;
				left: 65mm;
			}
			
			.main-table {
				border-left: 2px solid;
				width: 100%;
				position: relative;
				top: 0;
				left: 0;
				right: 0;
				bottom: 0;
				  border-collapse: collapse;
			  border-spacing: 2px;
				border-bottom: 2px solid
			}
			
			.main-table td{
				padding: 0;
				height: 3.9mm;
				border-left: 1px solid;
				border-bottom: 1px solid;
			}
			
			.main-table td.dotted{
			   border-bottom: 1px dotted;
			}
			
			.cell-7 {
				width: 45mm;
			}
			.cell-8 {
				width: 8mm;
			}
			.cell-9 {
				width: 10mm;
			}
			.cell-10 {
				width: 8mm;
			}
			.cell-11 {
				width: 15mm;
			}
			.cell-12 {
				width: 10mm;
			}
			.cell-13 {
				width: 24mm;
			}
			.cell-14 {
				width: 16mm;
			}
			
			.main-table-block .table-data{
				font-size: 10px;
				padding: 0 4px;
			}
			
			.middle-block-third {
				font-size: 0;
				width: 200mm;
				height: 179mm;
				position: relative;
			}
			
			.middle-block-third-left {
				width: 95mm;
				height: 100%;
				display: inline-block;
			}
			
			.middle-block-third-right {
				width: 105mm;
				height: 100%;
				display: inline-block;
				top: 0;
				position: absolute;
			}
			
			.middle-block-third-left>div:not(.dates-block){
				border-left: 3px solid;
			}
			
			.load-name-top {
				height: 65mm;
				border-right: 2px solid;
			}
			
			.load-name-bottom {
				height: 10mm;
				border-top: 1px dotted;
				border-bottom: 2px solid;
				border-right: 2px solid;
			}
			
			.dates-block {
				height: 35mm;
				font-size: 0;
				position: relative;
			}
			
			.doc-date {
				border-bottom: 3px solid;
				width: 47.5mm;
				height: 100%;
				border-right: 2px solid;
				border-left: 3px solid;
				position: absolute;
			}
			
			.arrival-date {
				width: 47.5mm;
				height: 100%;
				border-right: 2px solid;
				border-bottom: 3px solid;
				position: absolute;
				left: 47.5mm;
			}
			
			.sender-docs {
				height: 34mm;
				border-bottom: 2px solid;
				border-right: 2px solid;
			}
			
			.freight-charges {
				height: 35mm;
				border-bottom: 2px solid;
				border-right: 2px solid;
			}
			
			body {
				overflow: auto;
			}
			
			.genus-count-mass-seals-block {
				height: 65mm;
				font-size: 0;
				position: relative;
			}
			
			.genus {
				width: 20mm;
				height: 100%;
				border-right: 2px solid;
				position: absolute;
			}
			
			.count {
				width: 20mm;
				height: 100%;
				border-right: 2px solid;
				position: absolute;
				left: 20mm;
			}
			
			.mass {
				display: inline-block;
				width: 20mm;
				height: 100%;
				border-right: 2px solid;
				position: absolute;
				left: 40mm;
			}
			
			.seals {
				position: absolute;
				left: 60mm;
				width: 45mm;
				height: 100%;
			}
			
			.seals-title {
				height: 4mm;
				border-right: 3px solid;
				border-bottom: 2px solid;
			}
			
			.seals-table-title {
				height: 5mm;
				border-right: 3px solid;
				border-bottom: 2px solid;
			}
			
			.seals-table {
				height: 40mm;
				border-right: 3px solid;
				border-bottom: 2px solid;
				  border-collapse: collapse;
			  border-spacing: 2px;
			}
			
			.seals-td-count {
				width: 10mm;
				border-right: 2px solid;
			}
			
			.seals-td-seals {
				width: 35mm;
			}
			
			.seals-table td{
				border-bottom: 1px dotted;   
				font-size: 10px;
				height: 5mm;
					
			}
			.shipped {
				height: 7mm;
				border-right: 3px solid;
				border-bottom: 2px solid;
			}
			
			.weight-determining {
				height: 14.1mm;
				border-right: 3px solid;
			}
			
			.freighters-title {
				height: 5mm;
				border-top: 2px solid;
				border-bottom: 2px solid;
			}
			
			.freighters-block {
				height: 58mm;
			 }
			
			.freighters-table {
				height: 54mm;
				width: 105.3mm;
				border-right: 3px solid;
				border-bottom: 2px solid;
			  border-spacing: 0px;
			}
			
			
			.freighters-td {
			  width: 35mm;
				border-right: 1px dotted;
			}
			
			.lots-td {
				width: 50mm;
			}
			
			.stations-codes-td {
				width: 20mm;
				border-left: 1px dotted
			}
			
			.freighters-table td{
				border-bottom: 1px dotted;  
			}
			.info {
				margin-top: 1mm;
				height: 20mm;
				border-right: 3px solid;
				border-bottom: 2px solid;
			}
			
			.marks {
				height: 35mm;
				border-right:  3px solid;
				border-bottom: 3px solid;
			}
			
			.title {
				font-size: 9px;
				padding: 1px 4px;
			}
			
			.text {
				padding: 0px 4px;
				font-size: 8px
			}
			
			.code {
				padding: 0px 4px;
				font-size: 12px;
				font-family: bold 
			}
			
			.table-data-legend {
				font-size: 9px;
				padding: 1px 4px;
				line-height: 7mm;
			}
			
			.table-header-after {
				position: absolute;
				border-bottom: 1px solid;
				width: 39.6mm;
				top: 0;
				height: 5.6mm;
				line-height: 5.6mm;;
				text-align: center;
				
			}
			
			.complex-header {
				position: relative;
			}
			
			.table-header-mass {
				position: absolute;
				height: 5.8mm;
				width: 23.6mm;
				border-right: 1px solid;
				line-height: 5.8mm;
				text-align: center;
					
			}
			
			.table-header-count {
				position: absolute;
				height: 5.9mm;
				width: 16mm;
				left: 23.6mm;
				padding: 0px;
				line-height: 5.8mm;
				text-align: center;
			}
			
			.seals-count-header {
				position: absolute;
				line-height: 5mm;
				width: 9.8mm;
				text-align: center;
				height: 5mm;
				border-right: 2px solid;
			}
			
			.seals-seals-header {
				position: absolute;
				line-height: 5mm;
				left: 9.8mm;
				width: 35.3mm;
				text-align: center;
				height: 5mm;
				border-right: 3px solid
			}
			
			.fr-num {
				position: absolute;
				border-right: 2px solid;
				width: 5mm;
			}
			
			.fr-header {
				position: absolute;
				height: 4.5mm;
				text-align: center;
				line-height: 4.5mm;
			}
			
			.fr-first-col {
				left: 5mm;
				width: 29.7mm;
				border-right: 1px dotted;
			}
			
			.fr-second-col {
				left: 35mm;
				width: 49.6mm;
				border-right: 1px dotted;
			}
			
			.fr-third-col {
				left: 85mm;
				width: 20mm;
				border-right: 3px solid;
			}
			
			.vertical-align-text-span {
				font-style: italic;
				font-size: 16px;
			}
			
			.sender-signature {
				position: absolute;
				bottom: 0;
				height: 5mm;
				width: 100%;
				border-top: 1px dotted;
				font-size: 9px;
				line-height: 5mm;
				padding-left: 10px
			}
			
			.top-right-block {
				position: absolute;
				top: 0;
				right: 0;
				width: 20mm;
				height: 5mm;
				border-bottom: 1px dotted;
				border-left: 1px dotted;
			}
			
			.second-page {
				position: relative;
				width: 200mm;
				height: 287mm;
				page-break-before: always;
					page-break-inside: avoid;
			}
			
			.sheader {
				height: 10mm;
				width: 100%;
				position: relative;
			}
			
			.main-sheader {
				position: absolute;
				width: 128mm;
				height: 100%;
				line-height: 10mm;
				padding-left: 3px;
				font-size: 17px;
				border-bottom: 3px solid;
				border-right: 3px solid;
			}
			
			.sheader-sender-title {
				height: 10mm;
				width: 36mm;
				line-height: 10mm;
				left: 128mm;
				position: absolute;
				text-align: center;
				border-top: 3px solid;
				border-right: 2px solid;
				border-bottom: 2px solid;
					
			}
			
			.sheader-reciever-title {
				height: 10mm;
				width: 36mm;
				line-height: 10mm;
				left: 164mm;
				position: absolute;
				text-align: center;
				border-top: 3px solid;
				border-right: 3px solid;
				border-bottom: 2px solid;
			}
			
			.row-title {
				width: 4mm;
				height: 100%;
				position: absolute;
				line-height: 39mm;
				border-right: 2px solid;
				border-left: 3px solid;
				border-bottom: 3px solid;
			}
			
			.big-row {
				height: 39mm;
				width: 100%;
				position: relative;
			}
			
			.row-data-left {
				position: absolute;
				left: 4mm;
				width: 124mm;
				height: 100%;
			}
			
			.area-dist-mass-block {
				height: 19mm;
				position: relative;
			}
			
			.area-block {
				height: 100%;
				width: 74mm;
				position: absolute;
			}
			
			.area-title {
				position: relative;
				height: 5mm;
				line-height: 5mm;
			}
			
			.area-title-text {
				position: absolute;
				width: 56mm;
				border-bottom: 2px solid;
				border-right: 2px solid;
			}
			
			.area-title-codes {
				position: absolute;
				left: 56mm;
				width: 18mm;
				border-bottom: 2px solid;
				border-right: 2px solid;
			}
			
			.area-row-first {
				position: relative;
				height: 7mm;
			}
			
			.area-value-text {
				position: absolute;
				width: 56mm;
				height: 100%;
				border-bottom: 1px dotted;
				border-right: 1px dotted;
				padding-left: 20px;
				line-height: 7mm;
				padding-left: 20px;
				line-height: 7mm;
					
			}
			
			.area-value-codes {
				position: absolute;
				left: 56mm;
				width: 18mm;
				height: 100%;
				border-bottom: 1px dotted;
				border-right: 2px solid;
				line-height: 7mm;
				line-height: 7mm;
			}
			
			.area-row-second {
				height: 7mm;
				position: relative;
			}
			
			.area-row-second>.area-value-text,
			.area-row-second>.area-value-codes{
				border-bottom: 2px solid
			}
			
			.area-finish {
				position: absolute;
				font-size: 9px;
				bottom: 2px;
				left: 2px;
			}
			
			.area-start {
				position: absolute;
				font-size: 9px;
				bottom: 2px;
				left: 2px;
			}
			
			.distance {
				height: 100%;
				position: absolute;
				width: 22mm;
				left: 74mm;
			}
			
			.distance-title {
				height: 9mm;
				line-height: 9mm;
				border-right: 2px solid;
				border-bottom: 2px solid;
			}
			
			.distance-value {
				height: 10mm;
				border-right: 2px solid;
				border-bottom: 2px solid;
			}
			
			.calc-mass {
				height: 100%;
				position: absolute;
				width: 28mm;
				left: 96mm;
			}
			
			.calc-mass-title {
				height: 9mm;
				line-height: 9mm;
				border-right: 2px solid;
				border-bottom: 2px solid;
			}
			
			.calc-mass-value {
				height: 10mm;
				border-right: 2px solid;
				border-bottom: 2px solid;
			}
			
			.add-fees-title {
				width: 19mm;
				height: 10mm;
				font-size: 8px;
				position: absolute;
			}
			
			.add-fees-table {
			/*    height: 100%;*/
			/*    width: 105mm;*/
				border-spacing: 0px;
				position: relative;
				border-right: 2px solid;
				width: 100%;
				table-layout: fixed;
			}
			
			.add-fees-table td{
				border-left: 1px dotted;
				border-bottom: 1px dotted;
				width: 14.9mm;
				height: 5mm;
				font-size: 9px;
			/*    padding: 0 5px;*/
					
			}
			
			.add-fees-table td.equal{
				width: 19.6mm;
			}
			
			.add-fees-block {
				height: 10mm;
				position: relative;
				width: 100%;
				overflow: hidden;
			}
			
			.additional-params {
				height: 10mm;
				width: 100%;
				position: relative;
			}
			
			.tarif {
				position: absolute;
				height: 100%;
				width: 34mm;
				border-top: 2px solid;
				border-right: 2px solid;
				border-bottom: 3px solid;
				
			}
			
			.kod-gruza {
				 position: absolute;
				height: 100%;
				width: 35mm;
				left: 34mm;
				border-top: 2px solid;
				border-right: 2px solid;
				border-bottom: 3px solid;
			}
			
			.kurs {
				 position: absolute;
				height: 100%;
				width: 43mm;
				left: 69mm;
				border-top: 2px solid;
				border-right: 2px solid;
				border-bottom: 3px solid;
			}
			
			.itog {
				 position: absolute;
				height: 100%;
				width: 12mm;
				left: 112mm;
				border-top: 2px solid;
				border-right: 2px solid;
				border-bottom: 3px solid;
			}
			
			.itog-title {
				line-height: 10mm;
			}
			
			.row-data-right {
				position: absolute;
				left: 128mm;
				width: 72mm;
				height: 39mm;
			}
			
			.raschet-table {
				height: 100%;
				width: 100%;
				border-collapse: collapse;
				border-spacing: 0px;
				position: absolute;
				border-right: 3px solid;
				border-bottom: 3px solid
			
			}
			
			.raschet-table td{
				height: 10mm;
				width: 9mm;
				border-right: 2px solid;
				border-bottom: 2px solid;
				
			}
			
			.raschet-table td.first{
				height: 8.8mm;
			}
			
			.raschet-table td.first .title{
				margin-top: -16px; 
			}
			
			.raschet-table .title{
				margin-top: -17px;   
				font-size: 8px;
				overflow: hidden;
				padding: 0;
				letter-spacing: -.1px;
				position: absolute;
			
			}
			.right-row {
				height: 9mm;
				border-bottom: 2px solid;
				position: relative;
			}
			
			.right-row-big {
				height: 10mm;
				border-bottom: 2px solid;
				position: relative;
			}
			
			.right-row-big-end {
				height: 9.3mm;
				border-bottom: 3px solid;
				position: relative;
			}
			
			.right-row-big-middle {
				height: 10.6mm;
				border-bottom: 2px solid;
				position: relative;
			}
			
			.val-div-table-1 {
				width: 18mm;
				height: 100%;
				border-right: 2px solid;
				position: absolute;
			}
			
			.val-div-table-end {
				width: 18mm;
				height: 100%;
				border-right: 3px solid;
				position: absolute;
				left: 54mm;
			}
			
			.val-div-table-2 {
				width: 18mm;
				height: 100%;
				border-right: 2px solid;
				position: absolute;
				left: 18mm;
			}
			
			.val-div-table-3 {
				width: 18mm;
				height: 100%;
				border-right: 2px solid;
				position: absolute;
				left: 36mm;
			}
			.val-div-table-end  .title{
				letter-spacing: -.2px;
				padding: 0;
				position: absolute;
				font-size: 8px;
			}
			.val-div-table-3  .title{
				letter-spacing: -.2px;
				padding: 0;
				position: absolute;
				font-size: 8px;
			}
			.val-div-table-2  .title{
				letter-spacing: -.2px;
				padding: 0;
				position: absolute;
				font-size: 8px;
			}
			.val-div-table-1  .title{
				letter-spacing: -.2px;
				padding: 0;
				position: absolute;
				font-size: 8px;
			}
			.row-final {
				width: 200mm;
				height: 43mm;
				position: relative;
			}
			
			.itog-final {
				position: absolute;
				right: 0px;
				border-left: 2px solid;
				border-bottom: 2px solid;
				width: 12mm;
				height: 10mm;
				top: 0;
				line-height: 10mm;
			}
			
			.row-final-left {
				position: absolute;
				width: 128mm;
				height: 43mm;
				border-bottom: 3px solid;
				border-left: 3px solid;
				border-right: 2px solid
			}
			
			.row-final-text {
				padding-right: 12mm;
			}
			
			.row-final-right {
				position: absolute;
				left: 128mm;
				width: 72mm;
				height: 100%;    
			}
			
			.add-price {
				width: 72mm;
				height: 33mm;
				border-bottom: 3px solid;
				border-right: 3px solid;
			}
			
			.border-left-dotted {
				border-left: 1px dotted;
			}
			
			.border-bottom {
				border-bottom: 2px solid !important;
				text-align: center;
			}
			
			.add-fees-firstcol {
				font-size: 9px !important;
				width: 20.4mm !important;
				border: none !important;
			}
			
			tr.noborder>td{
				border-bottom: none;   
			}               
        </style>
    </head>
    <body>
        <div class="first-page" style="">
            <div class="header">
                <div class="header-title">Железнодорожная накладная (для налоговых целей)</div>
                <div class="header-right">
                    <div class="title">Отправка №</div>
                    <div class="code">
                        <font size="6px" face="bold"><xsl:value-of select="rwbe:RwBillExtract/rwbe:Number"/></font></div>
                </div>
            </div>

            <div class="middle-block-first">
                <div class="middle-block-first-left">
                    <div class="sender-reciever-title-block">
                        <!--div class="sender-reciever-block-left-title">
                            Накладная СМГС<br/>
                            <span class="vertical-align-text-span">
                                <xsl:value-of select="rwbe:RwBillExtract/rwbe:Carrier[1]/rwbe:CarrierName"/>
                            </span>
                        </div-->
                        <div class="sender-reciever-block">
                            <div class="sender">
                                <div class="title">Отправитель</div>
                                <div class="code">
                                    <xsl:apply-templates select="rwbe:RwBillExtract/rwbe:Consignor" mode="orgName"/><br/><br/>
                                    <xsl:apply-templates select="rwbe:RwBillExtract/rwbe:Consignor/cat_ru:Address"/>
                                </div>
                                <div class="sender-signature">Подпись 
                                    <xsl:value-of select="rwbe:RwBillExtract/rwbe:Consignor/rwbe:ConsignorSign"/>
                                </div>
                                <div class="top-right-block code">
                                    <xsl:value-of select="rwbe:RwBillExtract/rwbe:Consignor/rwbe:RBCode"/>
                                </div>
                            </div>
                            <div class="reciever">
                                <div class="title">Получатель</div>
                                <div class="code">
                                    <xsl:apply-templates select="rwbe:RwBillExtract/rwbe:Consignee" mode="orgName"/><br/><br/>
                                    <xsl:apply-templates select="rwbe:RwBillExtract/rwbe:Consignee/cat_ru:Address"/>
                                </div>
                                <div class="top-right-block code">
                                    <xsl:value-of select="rwbe:RwBillExtract/rwbe:Consignee/rwbe:RBCode"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="station-finish">
                        <div class="title">Станция назначения</div>
                        <div class="code">
                            <xsl:value-of select="rwbe:RwBillExtract/rwbe:DestinationStation/rwbe:RailwayAndStationName"/>
                        </div>
                        <div class="top-right-block code">
                            <xsl:value-of select="rwbe:RwBillExtract/rwbe:DestinationStation/rwbe:RailwayCode"/><xsl:text>&#160;</xsl:text> 
                            <xsl:value-of select="rwbe:RwBillExtract/rwbe:DestinationStation/rwbe:StationCode"/>
                        </div>
                    </div>
                </div>
                <div class="middle-block-first-right">
                    <div class="station-title">
                        <div class="title">Станция отправления</div>
                        <div class="code">
                            <xsl:value-of select="rwbe:RwBillExtract/rwbe:DepartureStation/rwbe:RWName"/>/
                            <xsl:value-of select="rwbe:RwBillExtract/rwbe:DepartureStation/rwbe:StationName"/>
                            </div>
                        <div class="top-right-block code" style="margin-right: -1px">
                            <xsl:value-of select="rwbe:RwBillExtract/rwbe:DepartureStation/rwbe:RailwayCode"/>
                            <xsl:text>&#160;</xsl:text>
                            <xsl:value-of select="rwbe:RwBillExtract/rwbe:DepartureStation/rwbe:StationCode"/>
                        </div>
                    </div>
                    <div class="statement">
                        <div class="title">Заявления отправителя</div>
                        <div class="code">
                            <xsl:value-of select="rwbe:RwBillExtract/rwbe:ConsignorNotice"/>
                        </div>
                    </div>
                </div>
            </div>
            <div style="border:1px solid; width:200mm;">
				<div class="title">Наименования и коды пограничных станций переходов:</div>
				<div class="code">
					<xsl:for-each select="rwbe:RwBillExtract/rwbe:BorderStation">
						<xsl:value-of select="position()"/>
							<xsl:text>. </xsl:text>
							<xsl:value-of select="rwbe:RWName"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="rwbe:StationName"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="rwbe:RwBillExtract/rwbe:DepartureStation/rwbe:RailwayCode"/>
                            <xsl:text>&#160;</xsl:text>
                            <xsl:value-of select="rwbe:RwBillExtract/rwbe:DepartureStation/rwbe:StationCode"/>
                            <xsl:if test="position()!=last()"><br/></xsl:if>
					</xsl:for-each>
				</div>
            </div>
            <div style="border:1px solid; border-top:0px; width:200mm;">
				<xsl:for-each select="rwbe:RwBillExtract/rwbe:TDInfo">
					<xsl:value-of select="rwbe:DocumentNumber"/>
					<xsl:text>. </xsl:text>
					<xsl:choose>
						<xsl:when test="rwbe:DocumentCode='1'">Декларация на товары</xsl:when>
						<xsl:when test="rwbe:DocumentCode='2'">Транзитная декларация</xsl:when>
					</xsl:choose>
					<xsl:text> № </xsl:text>
					<xsl:apply-templates select="."/>
					<table width="100%">
						<tbody>
							<tr>
								<td class="title">Номер и марка груза</td>
								<td class="title">Наименование груза</td>
								<td class="title">Код товара по ТН ВЭД ЕАЭС</td>
								<td class="title">Упаковка</td>
								<td class="title">Маркировка</td>
								<td class="title">Сведения о проводниках</td>
							</tr>
							<xsl:for-each select="rwbe:Goods">
							<tr>
								<td class="code">
									<xsl:value-of select="cat_ru:GoodsMarking"/>
								</td>
								<td class="code">
									<xsl:for-each select="cat_ru:GoodsDescription">
										<xsl:value-of select="."/>
									</xsl:for-each>
								</td>
								<td class="code">
									<xsl:value-of select="catTrans_ru:GoodsNomenclatureCode"/>
								</td>
								<td class="code">
									<xsl:value-of select="rwbe:Packing"/>
								</td>
								<td class="code">
									<xsl:value-of select="rwbe:Marking"/>
								</td>
								<td class="code">
									<xsl:value-of select="rwbe:ConductorDescription"/>
								</td>
							</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<xsl:if test="position()!=last()"><br/></xsl:if>
				</xsl:for-each>
            </div>
            <xsl:if test="rwbe:RwBillExtract/rwbe:Carriage">
				<div style="border:1px solid; border-top:0; width: 200mm;">
					<div class="title">Сведения о вагонах</div>
					<table width="100%">
						<tbody>
							<tr>
								<td class="title">Номер вагона</td>
								<td class="title">Предоставлен</td>
								<td class="title">Подъемная сила (тонны)</td>
								<td class="title">Количество осей</td>
								<td class="title">Вес тары</td>
								<td class="title">Тип</td>
								<td class="title">Вес груза</td>
							</tr>
							<xsl:for-each select="rwbe:RwBillExtract/rwbe:Carriage">
								<tr>
									<td class="code">
										<xsl:value-of select="rwbe:CarriageID"/>
									</td>
									<td class="code">
										<xsl:value-of select="rwbe:OwnerType"/>
									</td>
									<td class="code">
										<xsl:value-of select="rwbe:Power"/>
									</td>
									<td class="code">
										<xsl:value-of select="rwbe:AxisQuantity"/>
									</td>
									<td class="code">
										<xsl:value-of select="rwbe:Tare"/>
									</td>
									<td class="code">
										<xsl:value-of select="rwbe:Caliber"/>
									</td>
									<td class="code">
										<xsl:value-of select="rwbe:GoodsWeight"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
            </xsl:if>
            <xsl:if test="rwbe:RwBillExtract/rwbe:Container">
				<div style="border:1px solid; border-top:0; width:200mm;">
					<div class="title">Сведения о контейнерах</div>
					<table width="100%">
					<tbody>
						<tr>
							<td class="title">Номер контейнейра</td>
							<td class="title">Тип контейнера</td>
							<td class="title">Емкость контейнера</td>
							<td class="title">Масса тары контейнера (кг)</td>
							<td class="title">Масса груза в контейнере (кг)</td>
							<td class="title">Длина контейнера (футы)</td>
						</tr>
						<xsl:for-each select="rwbe:RwBillExtract/rwbe:Container">
							<tr>
								<td class="code">
									<xsl:value-of select="rwbe:ContainerID"/>
								</td>
								<td class="code">
									<xsl:value-of select="rwbe:ContainerKind"/>
								</td>
								<td class="code">
									<xsl:value-of select="rwbe:ContainerCapacity"/>
									<xsl:value-of select="rwbe:ContainerCapacityUnitQualifierCode"/>
								</td>
								<td class="code">
									<xsl:value-of select="rwbe:Tare"/>
								</td>
								<td class="code">
									<xsl:value-of select="rwbe:GoodsWeight"/>
								</td>
								<td class="code">
									<xsl:value-of select="rwbe:ContainerLength"/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
				</div>
            </xsl:if>
            <xsl:if test="rwbe:RwBillExtract/rwbe:Auto">
				<div style="border:1px solid; border-top: 0; width:200mm;">
					<div class="title">Сведения об интермодальных и автомобильных транспортных средствах</div>
					<table width="100%">
						<tbody>
							<tr>
								<td class="title">Транспортное средство</td>
								<td class="title">Номер вагона</td>
								<td class="title">Масса тары</td>
								<td class="title">Масса груза</td>
								<td class="title">Количество мест</td>
								<td class="title">Количество транспортных пакетов</td>
								<td class="title">Длина (м)</td>
							</tr>
							<xsl:for-each select="rwbe:RwBillExtract/rwbe:Auto">
								<tr>
									<td class="code" style="border-top:1px dashed;">
										<xsl:value-of select="cat_ru:VIN"/><br/>
										<xsl:value-of select="cat_ru:TransportKindCode"/><br/>
										<xsl:value-of select="cat_ru:TransportMarkCode"/><br/>
										<xsl:value-of select="cat_ru:TransportIdentifier"/><br/>
										<xsl:value-of select="cat_ru:TransportMeansNationalityCode"/><br/>
										<xsl:value-of select="cat_ru:ActiveTransportIdentifier"/><br/>
										<xsl:value-of select="cat_ru:TransportRegNumber"/>
									</td>
									<td class="code">
										<xsl:value-of select="rwbe:WagonNumber"/>
									</td>
									<td class="code">
										<xsl:value-of select="rwbe:Tare"/>
									</td>
									<td class="code">
										<xsl:value-of select="rwbe:GoodsWeight"/>
									</td>
									<td class="code">
										<xsl:value-of select="rwbe:PlacesQuantity"/>
									</td>
									<td class="code">
										<xsl:value-of select="rwbe:PocketQuantity"/>
									</td>
									<td class="code">
										<xsl:value-of select="rwbe:ContainerLength"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
            </xsl:if>
            <xsl:if test="rwbe:RwBillExtract/rwbe:ExchangePallet">
				<div style="border:1px solid; border-top:0; width:200mm;">
					<div class="title">Сведения об обменных поддонах</div>
					<table>
						<tbody>
							<tr>
								<td class="title">Код режима обмена поддонов</td>
								<td class="title">Количество плоских поддонов</td>
								<td class="title">Количество поддонов ящичного типа</td>
							</tr>
							<xsl:for-each select="rwbe:RwBillExtract/rwbe:ExchangePallet">
								<tr>
									<td>
										<xsl:value-of select="rwbe:ExchangeMode"/>
									</td>
									<td class="code">
										<xsl:value-of select="rwbe:FlatPalletQuantity"/>
									</td>
									<td class="code">
										<xsl:value-of select="rwbe:BoxPalletQuantity"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
            </xsl:if>
            <xsl:if test="rwbe:RwBillExtract/rwbe:WorkTool">
				<div style="border:1px solid; border-top:0; width:200mm;">
					<div class="title">Описание перевозочных приспособлений</div>
					<table>
						<tbody>
							<tr>
								<td class="title">Описание вида контейнера</td>
								<td class="title">Код железной дороги - владельца</td>
								<td class="title">Знак и номер</td>
							</tr>
							<xsl:for-each select="rwbe:RwBillExtract/rwbe:WorkTool">
								<tr>
									<td>
										<xsl:value-of select="rwbe:ContainerModeDescription"/>
									</td>
									<td class="code">
										<xsl:value-of select="rwbe:RailwayCode"/>
									</td>
									<td class="code">
										<xsl:value-of select="rwbe:BoxPalletQuantity"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
            </xsl:if>
            <xsl:if test="rwbe:RwBillExtract/rwbe:CarriersAndRoute">
				<div style="border:1px solid; border-top:0; width: 200mm;">
					<div class="title">Сведения о перевозчиках и маршруте</div>
					<table width="100%">
						<tbody>
							<tr>
								<td class="title">Наименование перевозчика</td>
								<td class="title">Код перевозчика</td>
								<td class="title">Перевозка от станции</td>
								<td class="title">Перевозка до станции</td>
							</tr>
							<xsl:for-each select="rwbe:RwBillExtract/rwbe:CarriersAndRoute">
								<tr>
									<td class="code">
										<xsl:value-of select="rwbe:CarrierName"/>
									</td>
									<td class="code">
										<xsl:value-of select="rwbe:CarrierCode"/>
									</td>
									<td class="code">
										<xsl:for-each select="rwbe:FromStation/*">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()"><br/></xsl:if>
										</xsl:for-each>
									</td>
									<td class="code">
										<xsl:for-each select="rwbe:ToStation/*">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()"><br/></xsl:if>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
            </xsl:if>
            <xsl:if test="rwbe:RwBillExtract/rwbe:PaidRailwayCodeName">
				<div style="border:1px solid; border-top:0; width:200mm;">
					<div class="title">Сведения об уплате провозных платежей</div>
					<table width="100%">
						<tbody>
							<tr>
								<td class="title">Код транзитной желездной дороги</td>
								<td class="title">Наименование транзитной желездной дороги</td>
								<td class="title">Плательщик</td>
							</tr>
							<xsl:for-each select="rwbe:RwBillExtract/rwbe:PaidRailwayCodeName">
								<tr>
									<td class="code">
										<xsl:value-of select="rwbe:PaidRailwayCode"/>
									</td>
									<td class="code">
										<xsl:value-of select="rwbe:PaidRailwayName"/>
										<xsl:value-of select="rwbe:PaidRailwayShortName"/>
									</td>
									<td class="code">
										<xsl:for-each select="rwbe:InfoPayer/*">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
            </xsl:if>
            <xsl:if test="rwbe:RwBillExtract/rwbe:Contract">
				<div style="border:1px solid; border-top: 0; width: 200mm;">
					<div class="title">Договор на поставку, заключенный между экспортером и импортером</div>
					<div class="code">
						<xsl:apply-templates select="rwbe:RwBillExtract/rwbe:Contract"/>
					</div>
				</div>
            </xsl:if>
            <div style="border:1px solid; border-top:0; width:200mm;">
				<div class="title">Наименование перевозчика:</div>
				<div class="code">
					<xsl:value-of select="rwbe:RwBillExtract/rwbe:ContractCarrierDate/rwbe:CarrierName"/>
				</div>
				<div class="title">Дата штемпеля:</div>
				<div class="code">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="rwbe:RwBillExtract/rwbe:ContractCarrierDate/rwbe:Date"/>
					</xsl:call-template>
				</div>
				<xsl:if test="rwbe:RwBillExtract/rwbe:ContractCarrierDate/rwbe:Time">
					<div class="title">Время:</div>
					<div class="code">
						<xsl:value-of select="rwbe:RwBillExtract/rwbe:ContractCarrierDate/rwbe:Time"/>
					</div>
				</xsl:if>
            </div>
        </div>
	</body>
</html>
</xsl:template>
<xsl:template match="rwbe:Contract">
	<xsl:if test="cat_ru:PrDocumentName">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
	</xsl:if>
	<xsl:if test="cat_ru:PrDocumentNumber">
		<xsl:text> № </xsl:text>
		<xsl:value-of select="cat_ru:PrDocumentNumber"/>
	</xsl:if>
	<xsl:if test="cat_ru:PrDocumentDate">
		<xsl:text> от </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
		</xsl:call-template>
	</xsl:if>

</xsl:template>
<xsl:template match="rwbe:TDInfo">
	<xsl:variable name="CustCode" select="cat_ru:CustomsCode"/>
	<xsl:variable name="date">
		<xsl:call-template name="number_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="gdtNum" select="cat_ru:GTDNumber"/>
	<xsl:value-of select="concat($CustCode,'/',$date,'/',$gdtNum)"/>
</xsl:template>
<xsl:template name="number_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
    
</xsl:stylesheet>
