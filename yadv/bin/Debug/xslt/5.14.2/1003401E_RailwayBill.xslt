<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonLeafTypesCust:5.12.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:rwb="urn:customs.ru:Information:TransportDocuments:Railway:RailwayBill:5.13.4" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:template match="rwb:Consignor|rwb:Consignee" mode="orgName">
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
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
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
          //background: white;
          outline: none;
          font: 8px/1.5 'Times New Roman';
          }

          body {
          position: absolute;
          bottom: 0;
          right: 0;
          left: 0;
          top: 0;
          overflow: hidden;
          background: #cccccc;
          }

          *{
          -webkit-padding-start: 0px;
          -webkit-margin-start: 0px;
          -moz-box-sizing: border-box;
          -webkit-box-sizing: border-box;
          -ms-box-sizing: border-box;
          box-sizing: border-box;
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
          /*filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3);*/
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
          height: 44mm;
          border-bottom: 1px solid;
          }

          .station-finish {
          height: 14mm;
          border-left: 1px solid;
          border-right: 1px solid;
          /*border-bottom: 1px solid;*/
          /*border-bottom: 1px solid;*/
          position: relative;
          }

          .table-legend {
          height: 7mm;
          /*border-bottom: 1px solid;*/
          }

          .middle-block-second {
          width: 200mm;
          font-size: 0;
          position: relative;
          }

          .border-stations {
          width: 65mm;
          height: 34.2mm;/*100%;*/
          border-left: 1px solid;
          border-top: 1px solid;
          /*border-bottom: 1px solid;*/
          position: absolute;
          }

          .main-table-block {
          width: 135mm;
          display: inline-block;
          border-top: 1px solid;
          border-right: 1px solid;
          position: relative;
          left: 65mm;
          }

          .main-table {
          border-left: 1px solid;
          width: 100%;
          position: relative;
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
          border-collapse: collapse;
          border-spacing: 1px;
          border-bottom: 1px solid
          }

          .main-table td{
          padding: 0;
          height: 3.9mm;
          border-left: 1px solid;
          border-bottom: 1px solid;
          }

          . td.dotted{
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
          /*display: inline-block;*/
          position:absolute;
          left:0;
          }

          .middle-block-third-right {
          width: 105mm;
          height: 100%;
          /*display: inline-block;*/
          top: 0;
          position: absolute;
          left: 95mm;
          height: 100%;
          }

          .middle-block-third-left>div:not(.dates-block){
          border-left: 1px solid;
          }

          .load-name-top {
          height: 65mm;
          border-top: 1px solid;
          border-right: 1px solid;
          }

          .load-name-bottom {
          height: 10mm;
          border-top: 1px dotted;
          border-bottom: 1px solid;
          border-right: 1px solid;
          }

          .dates-block {
          height: 35mm;
          font-size: 0;
          position: relative;
          }

          .doc-date {
          border-bottom: 0px solid;
          width: 47.5mm;
          height: 100%;
          border-right: 1px solid;
          border-left: 1px solid;
          position: absolute;
          }

          .arrival-date {
          width: 47.5mm;
          height: 100%;
          border-right: 1px solid;
          border-bottom: 0px solid;
          position: absolute;
          left: 47.5mm;
          }

          .sender-docs {
          height: 34mm;
          border-bottom: 1px solid;
          border-right: 1px solid;
          }

          .freight-charges {
          height: 35mm;
          border-bottom: 1px solid;
          border-right: 1px solid;
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
          border-right: 1px solid;
          position: absolute;
          }

          .count {
          width: 20mm;
          height: 100%;
          border-right: 1px solid;
          position: absolute;
          left: 20mm;
          }

          .mass {
          display: inline-block;
          width: 20mm;
          height: 100%;
          border-right: 1px solid;
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
          border-right: 1px solid;
          border-bottom: 1px solid;
          }

          .seals-table-title {
          height: 5mm;
          border-right: 1px solid;
          border-bottom: 1px solid;
          }

          .seals-table {
          height: 40mm;
          border-right: 1px solid;
          border-bottom: 1px solid;
          border-collapse: collapse;
          border-spacing: 1px;
          }

          .seals-td-count {
          width: 10mm;
          border-right: 1px solid;
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
          border-right: 1px solid;
          border-bottom: 1px solid;
          }

          .weight-determining {
          height: 14.1mm;
          border-right: 1px solid;
          }

          .freighters-title {
          height: 5mm;
          border-top: 1px solid;
          border-bottom: 1px solid;
          }

          .freighters-block {
          height: 58mm;
          position: relative;
          }

          .freighters-table {
          height: 54mm;
          width: 105.3mm;
          border-right: 1px solid;
          border-bottom: 1px solid;
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
          border-right: 1px solid;
          border-bottom: 1px solid;
          position:relative;
          }

          .marks {
          height: 35mm;
          border-right:  1px solid;
          border-bottom: 0px solid;
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
          font-size: 8px;
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
          border-right: 1px solid;
          }

          .seals-seals-header {
          position: absolute;
          line-height: 5mm;
          left: 9.8mm;
          width: 35.3mm;
          text-align: center;
          height: 5mm;
          border-right: 1px solid
          }

          .fr-num {
          position: absolute;
          border-right: 1px solid;
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
          border-right: 1px solid;
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
          padding-left: 1px;
          font-size: 17px;
          border-bottom: 1px solid;
          border-right: 1px solid;
          }

          .sheader-sender-title {
          height: 10mm;
          width: 36mm;
          line-height: 10mm;
          left: 128mm;
          position: absolute;
          text-align: center;
          border-top: 1px solid;
          border-right: 1px solid;
          border-bottom: 1px solid;

          }

          .sheader-reciever-title {
          height: 10mm;
          width: 36mm;
          line-height: 10mm;
          left: 164mm;
          position: absolute;
          text-align: center;
          border-top: 1px solid;
          border-right: 1px solid;
          border-bottom: 1px solid;
          }

          .row-title {
          width: 4mm;
          height: 100%;
          position: absolute;
          line-height: 39mm;
          border-right: 1px solid;
          border-left: 1px solid;
          border-bottom: 1px solid;
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
          border-bottom: 1px solid;
          border-right: 1px solid;
          }

          .area-title-codes {
          position: absolute;
          left: 56mm;
          width: 18mm;
          border-bottom: 1px solid;
          border-right: 1px solid;
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
          border-right: 1px solid;
          line-height: 7mm;
          line-height: 7mm;
          }

          .area-row-second {
          height: 7mm;
          position: relative;
          }

          .area-row-second>.area-value-text,
          .area-row-second>.area-value-codes{
          border-bottom: 1px solid
          }

          .area-finish {
          position: absolute;
          font-size: 9px;
          bottom: 1px;
          left: 1px;
          }

          .area-start {
          position: absolute;
          font-size: 9px;
          bottom: 1px;
          left: 1px;
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
          border-right: 1px solid;
          border-bottom: 1px solid;
          }

          .distance-value {
          height: 10mm;
          border-right: 1px solid;
          border-bottom: 1px solid;
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
          border-right: 1px solid;
          border-bottom: 1px solid;
          }

          .calc-mass-value {
          height: 10mm;
          border-right: 1px solid;
          border-bottom: 1px solid;
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
          border-right: 1px solid;
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
          border-top: 1px solid;
          border-right: 1px solid;
          border-bottom: 1px solid;

          }

          .kod-gruza {
          position: absolute;
          height: 100%;
          width: 35mm;
          left: 34mm;
          border-top: 1px solid;
          border-right: 1px solid;
          border-bottom: 1px solid;
          }

          .kurs {
          position: absolute;
          height: 100%;
          width: 43mm;
          left: 69mm;
          border-top: 1px solid;
          border-right: 1px solid;
          border-bottom: 1px solid;
          }

          .itog {
          position: absolute;
          height: 100%;
          width: 12mm;
          left: 112mm;
          border-top: 1px solid;
          border-right: 1px solid;
          border-bottom: 1px solid;
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
          border-right: 1px solid;
          border-bottom: 1px solid

          }

          .raschet-table td{
          height: 10mm;
          width: 9mm;
          border-right: 1px solid;
          border-bottom: 1px solid;

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
          border-bottom: 1px solid;
          position: relative;
          }

          .right-row-big {
          height: 10mm;
          border-bottom: 1px solid;
          position: relative;
          }

          .right-row-big-end {
          height: 9.3mm;
          border-bottom: 1px solid;
          position: relative;
          }

          .right-row-big-middle {
          height: 10.6mm;
          border-bottom: 1px solid;
          position: relative;
          }

          .val-div-table-1 {
          width: 18mm;
          height: 100%;
          border-right: 1px solid;
          position: absolute;
          }

          .val-div-table-end {
          width: 18mm;
          height: 100%;
          border-right: 1px solid;
          position: absolute;
          left: 54mm;
          }

          .val-div-table-2 {
          width: 18mm;
          height: 100%;
          border-right: 1px solid;
          position: absolute;
          left: 18mm;
          }

          .val-div-table-3 {
          width: 18mm;
          height: 100%;
          border-right: 1px solid;
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
          border-left: 1px solid;
          border-bottom: 1px solid;
          width: 12mm;
          height: 10mm;
          top: 0;
          line-height: 10mm;
          }

          .row-final-left {
          position: absolute;
          width: 128mm;
          height: 43mm;
          border-bottom: 1px solid;
          border-left: 1px solid;
          border-right: 1px solid
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
          border-bottom: 1px solid;
          border-right: 1px solid;
          }

          .border-left-dotted {
          border-left: 1px dotted;
          }

          .border-bottom {
          border-bottom: 1px solid !important;
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

          .first-page{
          width:210mm;
          margin: 6pt auto;
          padding: 5mm;
          background: #ffffff;
          border: solid 1pt #000000;
          }

          .second-page {
          position: relative;
          width: 210mm;
          margin: 6pt auto;
          /*height: 287mm;*/
          padding: 5mm;
          background: #ffffff;
          border: solid 1pt #000000;
          page-break-before: always;
          page-break-inside: avoid;
          }

          @media print {
			  .first-page {
			  border: none;
			  margin:0;
			  padding:0;
			  }
          }
        </style>
			</head>
			<body>
				<div class="first-page">
					<div class="header">
						<div class="header-title">Дорожная ведомость</div>
						<div class="header-right">
							<div class="title">29 Отправка №</div>
							<div class="code">
								<font size="6px" face="bold">
									<xsl:value-of select="rwb:RailwayBill/rwb:Number"/>
								</font>
							</div>
						</div>
					</div>
					<div class="middle-block-first">
						<div class="middle-block-first-left">
							<div class="sender-reciever-title-block">
								<!--div class="sender-reciever-block-left-title">
                            Накладная СМГС<br/>
                            <span class="vertical-align-text-span">
                                <xsl:value-of select="rwb:RailwayBill/rwb:Carrier[1]/rwb:CarrierName"/>
                                </span>
                        </div-->
								<div class="sender-reciever-block">
									<div class="sender">
										<div class="title">1 Отправитель</div>
										<div class="code">
											<xsl:apply-templates select="rwb:RailwayBill/rwb:Consignor" mode="orgName"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="rwb:RailwayBill/rwb:Consignor/cat_ru:Address"/>
										</div>
										<!--div class="sender-signature">Подпись 
                                    <xsl:value-of select="rwb:RailwayBill/rwb:Consignor/rwb:ConsignorSign"/>
                                </div-->
										<div class="top-right-block code">
											<xsl:value-of select="rwb:RailwayBill/rwb:Consignor/rwb:RBCode"/>
										</div>
									</div>
									<div class="reciever">
										<div class="title">4 Получатель</div>
										<div class="code">
											<xsl:apply-templates select="rwb:RailwayBill/rwb:Consignee" mode="orgName"/>
											<br/>
											<br/>
											<xsl:apply-templates select="rwb:RailwayBill/rwb:Consignee/cat_ru:Address"/>
										</div>
										<div class="top-right-block code">
											<xsl:value-of select="rwb:RailwayBill/rwb:Consignee/rwb:RBCode"/>
										</div>
									</div>
								</div>
							</div>
							<div class="station-finish">
								<div class="title">5 Станция назначения</div>
								<div class="code">
									<xsl:value-of select="rwb:RailwayBill/rwb:DestinationStation/rwb:RailwayAndStationName"/>
								</div>
								<div class="top-right-block code">
									<xsl:value-of select="rwb:RailwayBill/rwb:DestinationStation/rwb:RailwayCode"/>
									<xsl:text>&#160;</xsl:text>
									<xsl:value-of select="rwb:RailwayBill/rwb:DestinationStation/rwb:StationCode"/>
								</div>
							</div>
						</div>
						<div class="middle-block-first-right">
							<div class="station-title">
								<div class="title">2 Станция отправления</div>
								<div class="code">
									<xsl:value-of select="rwb:RailwayBill/rwb:DepartureStation/rwb:RWName"/>/
                            <xsl:value-of select="rwb:RailwayBill/rwb:DepartureStation/rwb:StationName"/>
								</div>
								<div class="top-right-block code" style="margin-right: -1px">
									<xsl:value-of select="rwb:RailwayBill/rwb:DepartureStation/rwb:RailwayCode"/>
									<xsl:text>&#160;</xsl:text>
									<xsl:value-of select="rwb:RailwayBill/rwb:DepartureStation/rwb:StationCode"/>
								</div>
							</div>
							<div class="statement">
								<div class="title">3 Заявления отправителя</div>
								<div class="code">
									<xsl:value-of select="rwb:RailwayBill/rwb:ConsignorNotice"/>
									<br/>
									<xsl:value-of select="rwb:RailwayBill/rwb:ConsignorOptionNotice"/>
								</div>
							</div>
							<div class="table-legend">
								<div class="table-data-legend">
                            8 Вагон представлен  9 Грузоподъемность 10 Оси 11 Масса тары 12 Тип цистерны
                        </div>
							</div>
						</div>
					</div>
					<div class="middle-block-second">
						<div class="border-stations">
							<div class="title">6 Пограничные станции переходов</div>
							<div class="code">
								<xsl:for-each select="rwb:RailwayBill/rwb:BorderStation">
									<xsl:value-of select="rwb:RWName"/>/
                            <xsl:value-of select="rwb:StationName"/>
									<xsl:text>&#160;</xsl:text>
									<xsl:value-of select="rwb:RailwayCode"/>
									<xsl:text>&#160;</xsl:text>
									<xsl:value-of select="rwb:StationCode"/>
									<br/>
								</xsl:for-each>
							</div>
						</div>
						<div class="main-table-block">
							<table class="main-table" cellpadding="5" cellspacing="0" border="0">
								<tr>
									<td class="cell-7" style="height:3mm;">
										<div class="table-data">7 Вагон</div>
									</td>
									<td class="cell-8" style="height:3mm;">
										<div class="table-data">8</div>
									</td>
									<td class="cell-9" style="height:3mm;">
										<div class="table-data">9</div>
									</td>
									<td class="cell-10" style="height:3mm;">
										<div class="table-data">10</div>
									</td>
									<td class="cell-11" style="height:3mm;">
										<div class="table-data">11</div>
									</td>
									<td class="cell-12" style="height:3mm;">
										<div class="table-data">12</div>
									</td>
									<td rowspan="3" colspan="2" style="height:11mm;" class="complex-header">
										<!--div class="table-header-after title">После перегрузки</div>
								<div class="table-header-mass title">13 Масса груза</div>
								<div class="table-header-count title">14 К-во мест</div-->
										<table width="100%" style="border:0px;">
											<tbody>
												<tr>
													<td colspan="2" class="title" align="center" style="height:5.5mm;border:0px; border-bottom:1px solid black">После перегрузки</td>
												</tr>
												<tr>
													<td class="title" align="center" style="height:5.5mm;width:23.6mm;border:0px; border-right:1px solid black">13 Масса груза</td>
													<td class="title" align="center" style="height:5.5mm;border:0px;">14 К-во мест</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td class="cell-7 dotted">
										<div class="table-data">
                            </div>
									</td>
									<td class="cell-8 dotted">
										<div class="table-data">
                            </div>
									</td>
									<td class="cell-9 dotted">
										<div class="table-data">
                            </div>
									</td>
									<td class="cell-10 dotted">
										<div class="table-data">
                            </div>
									</td>
									<td class="cell-11 dotted">
										<div class="table-data">
                            </div>
									</td>
									<td class="cell-12 dotted">
										<div class="table-data">
                            </div>
									</td>
								</tr>
								<tr>
									<td class="cell-7">
										<div class="table-data"/>
									</td>
									<td class="cell-8">
										<div class="table-data"/>
									</td>
									<td class="cell-9">
										<div class="table-data"/>
									</td>
									<td class="cell-10">
										<div class="table-data"/>
									</td>
									<td class="cell-11">
										<div class="table-data"/>
									</td>
									<td class="cell-12">
										<div class="table-data"/>
									</td>
								</tr>
								<tr>
									<td class="cell-7 dotted">
										<div class="table-data">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[1]/rwb:CarriageID"/>
											<xsl:text>&#160;</xsl:text>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[1]/rwb:RWName"/>
										</div>
									</td>
									<td class="cell-8 dotted">
										<div class="table-data">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[1]/rwb:OwnerType"/>
										</div>
									</td>
									<td class="cell-9 dotted">
										<div class="table-data">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[1]/rwb:Power"/>
										</div>
									</td>
									<td class="cell-10 dotted">
										<div class="table-data">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[1]/rwb:AxisQuantity"/>
										</div>
									</td>
									<td class="cell-11 dotted">
										<div class="table-data">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[1]/rwb:Tare"/>
										</div>
									</td>
									<td class="cell-12 dotted">
										<div class="table-data">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[1]/rwb:Caliber"/>
										</div>
									</td>
									<td class="cell-13 dotted">
										<div class="table-data">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[1]/rwb:GoodsWeight"/>
										</div>
									</td>
									<td class="cell-14 dotted">
										<div class="table-data"/>
									</td>
								</tr>
								<tr>
									<td class="cell-7">
										<div class="table-data">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[1]/rwb:OwnerName"/>
										</div>
									</td>
									<td class="cell-8">
										<div class="table-data"/>
									</td>
									<td class="cell-9">
										<div class="table-data"/>
									</td>
									<td class="cell-10">
										<div class="table-data"/>
									</td>
									<td class="cell-11">
										<div class="table-data"/>
									</td>
									<td class="cell-12">
										<div class="table-data"/>
									</td>
									<td class="cell-13">
										<div class="table-data"/>
									</td>
									<td class="cell-14">
										<div class="table-data"/>
									</td>
								</tr>
								<tr>
									<td class="cell-7 dotted">
										<div class="table-data">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[2]/rwb:CarriageID"/>
											<xsl:text>&#160;</xsl:text>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[2]/rwb:RWName"/>
										</div>
									</td>
									<td class="cell-8 dotted">
										<div class="table-data">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[2]/rwb:OwnerType"/>
										</div>
									</td>
									<td class="cell-9 dotted">
										<div class="table-data">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[2]/rwb:Power"/>
										</div>
									</td>
									<td class="cell-10 dotted">
										<div class="table-data">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[2]/rwb:AxisQuantity"/>
										</div>
									</td>
									<td class="cell-11 dotted">
										<div class="table-data">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[2]/rwb:Tare"/>
										</div>
									</td>
									<td class="cell-12 dotted">
										<div class="table-data">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[2]/rwb:Caliber"/>
										</div>
									</td>
									<td class="cell-13 dotted">
										<div class="table-data">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[2]/rwb:GoodsWeight"/>
										</div>
									</td>
									<td class="cell-14 dotted">
										<div class="table-data"/>
									</td>
								</tr>
								<tr>
									<td class="cell-7">
										<div class="table-data">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[2]/rwb:OwnerName"/>
										</div>
									</td>
									<td class="cell-8">
										<div class="table-data"/>
									</td>
									<td class="cell-9">
										<div class="table-data"/>
									</td>
									<td class="cell-10">
										<div class="table-data"/>
									</td>
									<td class="cell-11">
										<div class="table-data"/>
									</td>
									<td class="cell-12">
										<div class="table-data"/>
									</td>
									<td class="cell-13">
										<div class="table-data"/>
									</td>
									<td class="cell-14">
										<div class="table-data"/>
									</td>
								</tr>
								<tr>
									<td class="cell-7 dotted">
										<div class="table-data">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[3]/rwb:CarriageID"/>
											<xsl:text>&#160;</xsl:text>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[3]/rwb:RWName"/>
										</div>
									</td>
									<td class="cell-8 dotted">
										<div class="table-data">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[3]/rwb:OwnerType"/>
										</div>
									</td>
									<td class="cell-9 dotted">
										<div class="table-data">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[3]/rwb:Power"/>
										</div>
									</td>
									<td class="cell-10 dotted">
										<div class="table-data">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[3]/rwb:AxisQuantity"/>
										</div>
									</td>
									<td class="cell-11 dotted">
										<div class="table-data">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[3]/rwb:Tare"/>
										</div>
									</td>
									<td class="cell-12 dotted">
										<div class="table-data">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[3]/rwb:Caliber"/>
										</div>
									</td>
									<td class="cell-13 dotted">
										<div class="table-data">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[3]/rwb:GoodsWeight"/>
										</div>
									</td>
									<td class="cell-14 dotted">
										<div class="table-data"/>
									</td>
								</tr>
								<tr>
									<td class="cell-7">
										<div class="table-data">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carriage[3]/rwb:OwnerName"/>
										</div>
									</td>
									<td class="cell-8">
										<div class="table-data"/>
									</td>
									<td class="cell-9">
										<div class="table-data"/>
									</td>
									<td class="cell-10">
										<div class="table-data"/>
									</td>
									<td class="cell-11">
										<div class="table-data"/>
									</td>
									<td class="cell-12">
										<div class="table-data"/>
									</td>
									<td class="cell-13">
										<div class="table-data"/>
									</td>
									<td class="cell-14">
										<div class="table-data"/>
									</td>
								</tr>
								<xsl:for-each select="rwb:RailwayBill/rwb:Carriage">
									<xsl:if test="position() &gt; 3">
										<tr>
											<td class="cell-7 dotted">
												<div class="table-data">
													<xsl:value-of select="rwb:CarriageID"/>
													<xsl:text>&#160;</xsl:text>
													<xsl:value-of select="rwb:RWName"/>
												</div>
											</td>
											<td class="cell-8 dotted">
												<div class="table-data">
													<xsl:value-of select="rwb:OwnerType"/>
												</div>
											</td>
											<td class="cell-9 dotted">
												<div class="table-data">
													<xsl:value-of select="rwb:Power"/>
												</div>
											</td>
											<td class="cell-10 dotted">
												<div class="table-data">
													<xsl:value-of select="rwb:AxisQuantity"/>
												</div>
											</td>
											<td class="cell-11 dotted">
												<div class="table-data">
													<xsl:value-of select="rwb:Tare"/>
												</div>
											</td>
											<td class="cell-12 dotted">
												<div class="table-data">
													<xsl:value-of select="rwb:Caliber"/>
												</div>
											</td>
											<td class="cell-13 dotted">
												<div class="table-data">
													<xsl:value-of select="rwb:GoodsWeight"/>
												</div>
											</td>
											<td class="cell-14 dotted">
												<div class="table-data"/>
											</td>
										</tr>
										<tr>
											<td class="cell-7">
												<div class="table-data">
													<xsl:value-of select="rwb:OwnerName"/>
												</div>
											</td>
											<td class="cell-8">
												<div class="table-data"/>
											</td>
											<td class="cell-9">
												<div class="table-data"/>
											</td>
											<td class="cell-10">
												<div class="table-data"/>
											</td>
											<td class="cell-11">
												<div class="table-data"/>
											</td>
											<td class="cell-12">
												<div class="table-data"/>
											</td>
											<td class="cell-13">
												<div class="table-data"/>
											</td>
											<td class="cell-14">
												<div class="table-data"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</table>
						</div>
					</div>
					<div class="middle-block-third">
						<div class="middle-block-third-left">
							<div class="load-name-top">
								<div class="title">15 Наименование груза</div>
								<div class="code" style="font-size:10px">
									<xsl:for-each select="rwb:RailwayBill/rwb:RWBGoods">
										<xsl:for-each select="cat_ru:GoodsDescription">
											<xsl:value-of select="."/>
										</xsl:for-each>
										<xsl:if test="catTrans_ru:GoodsNomenclatureCode"> 
											<xsl:text> (код товара </xsl:text>
											<xsl:value-of select="catTrans_ru:GoodsNumeric"/>
											<xsl:text> по ТН ВЭД ЕАЭС: </xsl:text>
											<xsl:value-of select="catTrans_ru:GoodsNomenclatureCode"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
										<xsl:if test="rwb:MRN">
											<xsl:text>, MRN: </xsl:text>
											<xsl:for-each select="rwb:MRN">
												<xsl:value-of select="."/>
												<xsl:if test="position()!=last()">; </xsl:if>
											</xsl:for-each>
										</xsl:if>
										<xsl:if test="rwb:ContainerNumber">
											<xsl:text>, контейнер: </xsl:text>
											<xsl:value-of select="rwb:ContainerNumber"/>
										</xsl:if>
										<xsl:if test="position()!=last()"><br/></xsl:if>
									</xsl:for-each>
									<xsl:if test="//rwb:Container">
										<br/>
										<xsl:text>Контейнеры: </xsl:text>
										<xsl:for-each select="//rwb:Container">
											<xsl:value-of select="rwb:ContainerID"/>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
									</xsl:if>
								</div>
							</div>
							<div class="load-name-bottom">
								<div class="code">
									<xsl:for-each select="rwb:RailwayBill/rwb:RWBGoods">
										<xsl:value-of select="cat_ru:GoodsMarking"/>
										<xsl:if test="position()!=last()">
											<xsl:text> </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</div>
							</div>
							<div class="freight-charges">
								<div class="title">23 Уплата провозных платежей</div>
								<div class="code">
									<xsl:for-each select="rwb:RailwayBill/rwb:PaidRailwayCodeName">
										<xsl:value-of select="rwb:PaidRailwayShortName"/>
										<xsl:if test="rwb:InfoPayer">:
									<xsl:value-of select="rwb:InfoPayer/rwb:PayerName"/>
											<xsl:if test="rwb:InfoPayer/rwb:PayerCode">
										код <xsl:value-of select="rwb:InfoPayer/rwb:PayerCode"/>
											</xsl:if>
										</xsl:if>
										<br/>
									</xsl:for-each>
								</div>
							</div>
							<div class="sender-docs">
								<div class="title">24 Документы, приложенные отправителем</div>
								<div class="code">
									<xsl:for-each select="rwb:RailwayBill/rwb:ConsignorDocument">
										<xsl:value-of select="catTrans_ru:ModeCode"/>
										<xsl:text> </xsl:text>
										<xsl:if test="cat_ru:PrDocumentName">
											<xsl:value-of select="cat_ru:PrDocumentName"/>
										</xsl:if>
										<xsl:if test="cat_ru:PrDocumentNumber">
									№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
										</xsl:if>
										<xsl:if test="cat_ru:PrDocumentDate">
									от <xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</xsl:if>
										<p/>
									</xsl:for-each>
								</div>
							</div>
							<div class="dates-block">
								<div class="doc-date">
									<div class="title">26 Дата заключения договора перевозки</div>
									<div class="code">
										<xsl:value-of select="rwb:RailwayBill/rwb:ContractCarrierDate/rwb:CarrierName"/>
										<br/>
										<xsl:if test="rwb:RailwayBill/rwb:ContractCarrierDate/rwb:Station/rwb:RWName">
											<xsl:value-of select="rwb:RailwayBill/rwb:ContractCarrierDate/rwb:Station/rwb:RWName"/>/
                                </xsl:if>
										<xsl:value-of select="rwb:RailwayBill/rwb:ContractCarrierDate/rwb:Station/rwb:StationName"/>
										<br/>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="rwb:RailwayBill/rwb:ContractCarrierDate/rwb:Date"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="arrival-date">
									<div class="title">27 Дата прибытия</div>
									<div class="code">
										<!--    Вводить текст здесь-->
										<xsl:value-of select="rwb:RailwayBill/rwb:ArrivalDate/rwb:CarrierName"/>
										<br/>
										<xsl:if test="rwb:RailwayBill/rwb:ArrivalDate/rwb:Station/rwb:RWName">
											<xsl:value-of select="rwb:RailwayBill/rwb:ArrivalDate/rwb:Station/rwb:RWName"/>/
                                </xsl:if>
										<xsl:value-of select="rwb:RailwayBill/rwb:ArrivalDate/rwb:Station/rwb:StationName"/>
										<br/>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="rwb:RailwayBill/rwb:ArrivalDate/rwb:Date"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
						<div class="middle-block-third-right">
							<div class="genus-count-mass-seals-block">
								<div class="genus">
									<div class="title">16 Род упаковки</div>
									<div class="code">
										<xsl:for-each select="rwb:RailwayBill/rwb:RWBGoods">
											<xsl:value-of select="rwb:Packing"/>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</div>
								</div>
								<div class="count">
									<div class="title">17 К-во мест</div>
									<div class="code">
										<xsl:for-each select="rwb:RailwayBill/rwb:RWBGoods">
											<xsl:if test="rwb:PlacesQuantity &gt; 0">
												<xsl:value-of select="rwb:PlacesQuantity"/>
											</xsl:if>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
											<!--xsl:if test="rwb:RailwayBill/Goods/PlacesQuantiy=0">
										<xsl:value-of select="rwb:RailwayBill/Goods/PackingName"/>
									</xsl:if-->
										</xsl:for-each>
									</div>
								</div>
								<div class="mass">
									<div class="title">18 Масса ( в кг )</div>
									<div class="code">
										<xsl:for-each select="rwb:RailwayBill/rwb:RWBGoods">
											<xsl:value-of select="rwb:GrossWeightQuantity"/>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</div>
								</div>
								<div class="seals">
									<!--div class="seals-title title"> 19 Пломбы</div-->
									<!--
                            <div class="seals-table-title">
                                <div class="seals-count-header title">к-во</div>
                                <div class="seals-seals-header title">знаки</div>
                            </div>
-->
									<table class="seals-table">
										<tr>
											<td colspan="2" class="seals-title title" align="center">
										 19 Пломбы
									</td>
										</tr>
										<tr>
											<td class="seals-td-count border-bottom">к-во</td>
											<td class="seals-td-seals border-bottom">знаки</td>
										</tr>
										<tr>
											<td class="seals-td-count">
												<xsl:value-of select="rwb:RailwayBill/rwb:Seal[1]/rwb:SealQuantity"/>
											</td>
											<td class="seals-td-seals">
												<xsl:value-of select="rwb:RailwayBill/rwb:Seal[1]/rwb:SealID"/>
											</td>
										</tr>
										<tr>
											<td class="seals-td-count">
												<xsl:value-of select="rwb:RailwayBill/rwb:Seal[2]/rwb:SealQuantity"/>
											</td>
											<td class="seals-td-seals">
												<xsl:value-of select="rwb:RailwayBill/rwb:Seal[2]/rwb:SealID"/>
											</td>
										</tr>
										<tr>
											<td class="seals-td-count">
												<xsl:value-of select="rwb:RailwayBill/rwb:Seal[3]/rwb:SealQuantity"/>
											</td>
											<td class="seals-td-seals">
												<xsl:value-of select="rwb:RailwayBill/rwb:Seal[3]/rwb:SealID"/>
											</td>
										</tr>
										<tr>
											<td class="seals-td-count">
												<xsl:value-of select="rwb:RailwayBill/rwb:Seal[4]/rwb:SealQuantity"/>
											</td>
											<td class="seals-td-seals">
												<xsl:value-of select="rwb:RailwayBill/rwb:Seal[4]/rwb:SealID"/>
											</td>
										</tr>
										<tr>
											<td class="seals-td-count">
												<xsl:value-of select="rwb:RailwayBill/rwb:Seal[5]/rwb:SealQuantity"/>
											</td>
											<td class="seals-td-seals">
												<xsl:value-of select="rwb:RailwayBill/rwb:Seal[5]/rwb:SealID"/>
											</td>
										</tr>
										<tr>
											<td class="seals-td-count">
												<xsl:value-of select="rwb:RailwayBill/rwb:Seal[6]/rwb:SealQuantity"/>
											</td>
											<td class="seals-td-seals">
												<xsl:value-of select="rwb:RailwayBill/rwb:Seal[6]/rwb:SealID"/>
											</td>
										</tr>
										<tr>
											<td class="seals-td-count">
												<xsl:value-of select="rwb:RailwayBill/rwb:Seal[7]/rwb:SealQuantity"/>
											</td>
											<td class="seals-td-seals">
												<xsl:value-of select="rwb:RailwayBill/rwb:Seal[7]/rwb:SealID"/>
											</td>
										</tr>
									</table>
									<div class="shipped">
										<div class="title">20 Погружено</div>
										<div class="code">
											<xsl:value-of select="rwb:RailwayBill/rwb:LoaderModeDescription"/>
										</div>
									</div>
									<div class="weight-determining">
										<div class="title">21 Способ определения массы</div>
										<div class="code">
											<xsl:value-of select="rwb:RailwayBill/rwb:WeightDefinitionModeDescription"/>
										</div>
									</div>
								</div>
							</div>
							<div class="freighters-block">
								<div class="freighters-title">
									<div class="fr-num fr-header title">22</div>
									<div class="fr-first-col fr-header title">Перевозчики</div>
									<div class="fr-second-col fr-header title">(Участки от/до)</div>
									<div class="fr-third-col fr-header title">(Коды станций)</div>
								</div>
								<table class="freighters-table code">
									<tr>
										<td class="freighters-td" rowspan="2">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[1]/rwb:CarrierName"/>
											<br/>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[1]/rwb:CarrierCode"/>
										</td>
										<td class="lots-td" rowspan="2">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[1]/rwb:FromStation/rwb:StationName"/>
											<br/>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[1]/rwb:ToStation/rwb:StationName"/>
										</td>
										<td class="stations-codes-td">
											<!--xsl:value-of select="rwb:RailwayBill/rwb:Carrier[1]/rwb:FromStation/rwb:AdminCode"/-->
											<xsl:text>&#160;</xsl:text>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[1]/rwb:FromStation/rwb:StationCode"/>
										</td>
									</tr>
									<tr>
										<td class="border-left-dotted">
											<!--xsl:value-of select="rwb:RailwayBill/rwb:Carrier[1]/rwb:ToStation/rwb:AdminCode"/-->
											<xsl:text>&#160;</xsl:text>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[1]/rwb:ToStation/rwb:StationCode"/>
										</td>
									</tr>
									<tr>
										<td class="freighters-td" rowspan="2">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[2]/rwb:CarrierName"/>
											<br/>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[2]/rwb:CarrierCode"/>
										</td>
										<td class="lots-td" rowspan="2">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[2]/rwb:FromStation/rwb:StationName"/>
											<br/>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[2]/rwb:ToStation/rwb:StationName"/>
										</td>
										<td class="stations-codes-td">
											<!--xsl:value-of select="rwb:RailwayBill/rwb:Carrier[2]/rwb:FromStation/rwb:AdminCode"/-->
											<xsl:text>&#160;</xsl:text>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[2]/rwb:FromStation/rwb:StationCode"/>
										</td>
									</tr>
									<tr>
										<td class="border-left-dotted">
											<!--xsl:value-of select="rwb:RailwayBill/rwb:Carrier[2]/rwb:ToStation/rwb:AdminCode"/-->
											<xsl:text>&#160;</xsl:text>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[2]/rwb:ToStation/rwb:StationCode"/>
										</td>
									</tr>
									<tr>
										<td class="freighters-td" rowspan="2">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[3]/rwb:CarrierName"/>
											<br/>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[3]/rwb:CarrierCode"/>
										</td>
										<td class="lots-td" rowspan="2">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[3]/rwb:FromStation/rwb:StationName"/>
											<br/>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[3]/rwb:ToStation/rwb:StationName"/>
										</td>
										<td class="stations-codes-td">
											<!--xsl:value-of select="rwb:RailwayBill/rwb:Carrier[3]/rwb:FromStation/rwb:AdminCode"/-->
											<xsl:text>&#160;</xsl:text>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[3]/rwb:FromStation/rwb:StationCode"/>
										</td>
									</tr>
									<tr>
										<td class="border-left-dotted">
											<!--xsl:value-of select="rwb:RailwayBill/rwb:Carrier[3]/rwb:ToStation/rwb:AdminCode"/-->
											<xsl:text>&#160;</xsl:text>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[3]/rwb:ToStation/rwb:StationCode"/>
										</td>
									</tr>
									<tr>
										<td class="freighters-td" rowspan="2">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[4]/rwb:CarrierName"/>
											<br/>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[4]/rwb:CarrierCode"/>
										</td>
										<td class="lots-td" rowspan="2">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[4]/rwb:FromStation/rwb:StationName"/>
											<br/>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[4]/rwb:ToStation/rwb:StationName"/>
										</td>
										<td class="stations-codes-td">
											<!--xsl:value-of select="rwb:RailwayBill/rwb:Carrier[4]/rwb:FromStation/rwb:AdminCode"/-->
											<xsl:text>&#160;</xsl:text>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[4]/rwb:FromStation/rwb:StationCode"/>
										</td>
									</tr>
									<tr>
										<td class="border-left-dotted">
											<!--xsl:value-of select="rwb:RailwayBill/rwb:Carrier[4]/rwb:ToStation/rwb:AdminCode"/-->
											<xsl:text>&#160;</xsl:text>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[4]/rwb:ToStation/rwb:StationCode"/>
										</td>
									</tr>
									<tr>
										<td class="freighters-td" rowspan="2">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[5]/rwb:CarrierName"/>
											<br/>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[5]/rwb:CarrierCode"/>
										</td>
										<td class="lots-td" rowspan="2">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[5]/rwb:FromStation/rwb:StationName"/>
											<br/>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[5]/rwb:ToStation/rwb:StationName"/>
										</td>
										<td class="stations-codes-td">
											<!--xsl:value-of select="rwb:RailwayBill/rwb:Carrier[5]/rwb:FromStation/rwb:AdminCode"/-->
											<xsl:text>&#160;</xsl:text>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[5]/rwb:FromStation/rwb:StationCode"/>
										</td>
									</tr>
									<tr>
										<td class="border-left-dotted">
											<!--xsl:value-of select="rwb:RailwayBill/rwb:Carrier[5]/rwb:ToStation/rwb:AdminCode"/-->
											<xsl:text>&#160;</xsl:text>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[5]/rwb:ToStation/rwb:StationCode"/>
										</td>
									</tr>
									<tr>
										<td class="freighters-td" rowspan="2">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[6]/rwb:CarrierName"/>
											<br/>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[6]/rwb:CarrierCode"/>
										</td>
										<td class="lots-td" rowspan="2">
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[6]/rwb:FromStation/rwb:StationName"/>
											<br/>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[6]/rwb:ToStation/rwb:StationName"/>
										</td>
										<td class="stations-codes-td">
											<!--xsl:value-of select="rwb:RailwayBill/rwb:Carrier[6]/rwb:FromStation/rwb:AdminCode"/-->
											<xsl:text>&#160;</xsl:text>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[6]/rwb:FromStation/rwb:StationCode"/>
										</td>
									</tr>
									<tr>
										<td class="border-left-dotted">
											<!--xsl:value-of select="rwb:RailwayBill/rwb:Carrier[6]/rwb:ToStation/rwb:AdminCode"/-->
											<xsl:text>&#160;</xsl:text>
											<xsl:value-of select="rwb:RailwayBill/rwb:Carrier[6]/rwb:ToStation/rwb:StationCode"/>
										</td>
									</tr>
								</table>
							</div>
							<div class="info">
								<div class="title" style="position:relative">25 Информация, не предназначенная для перевозчика, № договора на поставку</div>
								<div class="code">
									<xsl:value-of select="rwb:RailwayBill/rwb:Contract/cat_ru:PrDocumentName"/>
									<xsl:if test="rwb:RailwayBill/rwb:Contract/cat_ru:PrDocumentNumber">
								№ <xsl:value-of select="rwb:RailwayBill/rwb:Contract/cat_ru:PrDocumentNumber"/>
									</xsl:if>
									<xsl:if test="rwb:RailwayBill/rwb:Contract/cat_ru:PrDocumentDate">
								от <xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="rwb:RailwayBill/rwb:Contract/cat_ru:PrDocumentDate"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div class="marks">
								<div class="title">28 Отметки для выполнения таможенных и других административных формальностей</div>
								<div class="code">
									<!-- Вводить текст здесь -->
									<xsl:if test="rwb:RailwayBill/rwb:MRN">
										<xsl:text>MRN: </xsl:text>
										<xsl:for-each select="rwb:RailwayBill/rwb:MRN">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()">; </xsl:if>
										</xsl:for-each>
										<br/>
									</xsl:if>
									<xsl:value-of select="rwb:RailwayBill/rwb:CustomsNotice"/>
									<xsl:if test="rwb:RailwayBill/rwb:Mark">
										<br/>
										<xsl:text>Отметки о прохождении контроля: признак </xsl:text>
										<xsl:if test="rwb:RailwayBill/rwb:Mark/rwb:MarkSing='true' or rwb:RailwayBill/rwb:Mark/rwb:MarkSing='1'">есть</xsl:if>
										<xsl:if test="rwb:RailwayBill/rwb:Mark/rwb:MarkSing='false' or rwb:RailwayBill/rwb:Mark/rwb:MarkSing='0'">нет</xsl:if>
										<xsl:text>, тип </xsl:text>
										<xsl:value-of select="rwb:RailwayBill/rwb:Mark/rwb:MarkKind"/>
										<xsl:if test="rwb:RailwayBill/rwb:Mark/rwb:ResultControl">
											<xsl:text>, результат: </xsl:text>
											<xsl:value-of select="rwb:RailwayBill/rwb:Mark/rwb:ResultControl"/>
										</xsl:if>
									</xsl:if>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="second-page">
					<div class="sheader">
						<div class="main-sheader">Разделы по расчёту провозных платежей</div>
						<div class="sheader-sender-title title">Расчёты с отправителем</div>
						<div class="sheader-reciever-title title">Расчёты с получателем</div>
					</div>
					<div class="row-A big-row">
						<div class="row-title">А</div>
						<xsl:call-template name="ABCDEF">
							<xsl:with-param name="CarrierCharge" select="rwb:RailwayBill/rwb:CarrierCharge[1]"/>
						</xsl:call-template>
					</div>
					<div class="row-B big-row">
						<div class="row-title">Б</div>
						<xsl:call-template name="ABCDEF">
							<xsl:with-param name="CarrierCharge" select="rwb:RailwayBill/rwb:CarrierCharge[2]"/>
						</xsl:call-template>
					</div>
					<div class="row-C big-row">
						<div class="row-title">В</div>
						<xsl:call-template name="ABCDEF">
							<xsl:with-param name="CarrierCharge" select="rwb:RailwayBill/rwb:CarrierCharge[3]"/>
						</xsl:call-template>
					</div>
					<div class="row-D big-row">
						<div class="row-title">Г</div>
						<xsl:call-template name="ABCDEF">
							<xsl:with-param name="CarrierCharge" select="rwb:RailwayBill/rwb:CarrierCharge[4]"/>
						</xsl:call-template>
					</div>
					<div class="row-E big-row">
						<div class="row-title">Д</div>
						<xsl:call-template name="ABCDEF">
							<xsl:with-param name="CarrierCharge" select="rwb:RailwayBill/rwb:CarrierCharge[5]"/>
						</xsl:call-template>
					</div>
					<div class="row-F big-row">
						<div class="row-title">Е</div>
						<xsl:call-template name="ABCDEF">
							<xsl:with-param name="CarrierCharge" select="rwb:RailwayBill/rwb:CarrierCharge[6]"/>
						</xsl:call-template>
					</div>
					<div class="row-final">
						<div class="row-final-left">
							<div class="title">64 Отметки для исчисления и взимания провозных платежей</div>
							<div class="text row-final-text">
								<br/>
								<br/>
								<xsl:value-of select="rwb:RailwayBill/rwb:CalculationNotice"/>
							</div>
							<div class="itog-final title">
                        Всего:
                    </div>
						</div>
						<div class="row-final-right">
							<div class="right-row-big">
								<div class="val-div-table-1">
									<div class="title">60</div>
									<br/>
									<div class="text">
										<xsl:value-of select="rwb:RailwayBill/rwb:Amount60"/>
									</div>
								</div>
								<div class="val-div-table-2">
									<div class="title">61</div>
									<br/>
									<div class="text">
										<xsl:value-of select="rwb:RailwayBill/rwb:Amount61"/>
									</div>
								</div>
								<div class="val-div-table-3">
									<div class="title">62</div>
									<br/>
									<div class="text">
										<xsl:value-of select="rwb:RailwayBill/rwb:Amount62"/>
									</div>
								</div>
								<div class="val-div-table-end">
									<div class="title">63</div>
									<br/>
									<div class="text">
										<!--    Вводить текст здесь-->
									</div>
								</div>
							</div>
							<div class="add-price">
								<div class="title">65 Дополнительно взыскать с отправителя за</div>
								<br/>
								<div class="text">
									<xsl:value-of select="rwb:RailwayBill/rwb:Amount63"/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="ABCDEF">
		<xsl:param name="CarrierCharge"/>
		<div class="row-data-left">
			<div class="area-dist-mass-block">
				<div class="area-block">
					<div class="area-title">
						<div class="area-title-text title">37 Участок</div>
						<div class="area-title-codes title">Коды станций</div>
					</div>
					<div class="area-row-first">
						<div class="area-value-text text"/>
						<div class="area-value-codes text">
							<xsl:value-of select="$CarrierCharge/rwb:FromStation/rwb:RailwayCode"/>
							<xsl:text>&#160;</xsl:text>
							<xsl:value-of select="$CarrierCharge/rwb:FromStation/rwb:StationCode"/>
						</div>
						<div class="area-start">от 
					<xsl:value-of select="$CarrierCharge/rwb:FromStation/rwb:StationName"/>
						</div>
					</div>
					<div class="area-row-second">
						<div class="area-value-text text"/>
						<div class="area-value-codes text">
							<xsl:value-of select="$CarrierCharge/rwb:ToStation/rwb:RailwayCode"/>
							<xsl:text>&#160;</xsl:text>
							<xsl:value-of select="$CarrierCharge/rwb:ToStation/rwb:StationCode"/>
						</div>
						<div class="area-finish">до
					<xsl:value-of select="$CarrierCharge/rwb:ToStation/rwb:StationName"/>
						</div>
					</div>
				</div>
				<div class="distance">
					<div class="distance-title title">38 Расстояние, км</div>
					<div class="distance-value text">
						<xsl:value-of select="$CarrierCharge/rwb:Distance"/>
					</div>
				</div>
				<div class="calc-mass">
					<div class="calc-mass-title title">39 Расчётная масса, кг</div>
					<div class="calc-mass-value text">
						<xsl:value-of select="$CarrierCharge/rwb:CalcWeight"/>
					</div>
				</div>
			</div>
			<div class="add-fees-block">
				<table class="add-fees-table">
					<tr>
						<td rowspan="2" class="add-fees-firstcol">40Дополнительные сборы</td>
						<td/>
						<td class="equal">=</td>
						<td/>
						<td class="equal">=</td>
						<td/>
						<td class="equal">=</td>
					</tr>
					<tr class="noborder">
						<td/>
						<td class="equal">=</td>
						<td/>
						<td class="equal">=</td>
						<td/>
						<td class="equal">=</td>
					</tr>
				</table>
			</div>
			<div class="additional-params">
				<div class="tarif">
					<div class="title">41 Тариф</div>
					<div class="text">
						<xsl:value-of select="$CarrierCharge/rwb:TarifCode"/>
					</div>
				</div>
				<div class="kod-gruza">
					<div class="title">42 Код груза</div>
					<div class="text">
						<xsl:value-of select="$CarrierCharge/rwb:CalcCargoCode"/>
					</div>
				</div>
				<div class="kurs">
					<div class="title">43 Курс пересчета</div>
					<div class="text">
						<xsl:value-of select="$CarrierCharge/rwb:CurrencyRate"/>
					</div>
				</div>
				<div class="itog">
					<div class="itog-title title">Итого:</div>
				</div>
			</div>
		</div>
		<div class="row-data-right">
			<div class="right-row">
				<div class="val-div-table-1">
					<div class="title">44 Валюта тарифа</div>
					<br/>
					<div class="text">
						<xsl:value-of select="$CarrierCharge/rwb:SndTarifCurrencyCode"/>
					</div>
				</div>
				<div class="val-div-table-2">
					<div class="title">45 Валюта платежа</div>
					<br/>
					<div class="text">
						<xsl:value-of select="$CarrierCharge/rwb:SndPaymentCurrency"/>
					</div>
				</div>
				<div class="val-div-table-3">
					<div class="title">46 Валюта тарифа</div>
					<br/>
					<div class="text">
						<xsl:value-of select="$CarrierCharge/rwb:RcvTarifCurrencyCode"/>
					</div>
				</div>
				<div class="val-div-table-end">
					<div class="title">47 Валюта платежа</div>
					<br/>
					<div class="text">
						<xsl:value-of select="$CarrierCharge/rwb:RcvPaymentCurrency"/>
					</div>
				</div>
			</div>
			<div class="right-row-big">
				<div class="val-div-table-1">
					<div class="title">48</div>
					<br/>
					<div class="text">
						<xsl:value-of select="$CarrierCharge/rwb:Amount48"/>
					</div>
				</div>
				<div class="val-div-table-2">
					<div class="title">49</div>
					<br/>
					<div class="text">
						<xsl:value-of select="$CarrierCharge/rwb:Amount49"/>
					</div>
				</div>
				<div class="val-div-table-3">
					<div class="title">50</div>
					<br/>
					<div class="text">
						<xsl:value-of select="$CarrierCharge/rwb:Amount50"/>
					</div>
				</div>
				<div class="val-div-table-end">
					<div class="title">51</div>
					<br/>
					<div class="text">
						<xsl:value-of select="$CarrierCharge/rwb:Amount51"/>
					</div>
				</div>
			</div>
			<div class="right-row-big-middle">
				<div class="val-div-table-1">
					<div class="title">52</div>
					<br/>
					<div class="text">
						<xsl:value-of select="$CarrierCharge/rwb:Amount52"/>
					</div>
				</div>
				<div class="val-div-table-2">
					<div class="title">53</div>
					<br/>
					<div class="text">
						<xsl:value-of select="$CarrierCharge/rwb:Amount53"/>
					</div>
				</div>
				<div class="val-div-table-3">
					<div class="title">54</div>
					<br/>
					<div class="text">
						<xsl:value-of select="$CarrierCharge/rwb:Amount54"/>
					</div>
				</div>
				<div class="val-div-table-end">
					<div class="title">55</div>
					<br/>
					<div class="text">
						<xsl:value-of select="$CarrierCharge/rwb:Amount55"/>
					</div>
				</div>
			</div>
			<div class="right-row-big-end">
				<div class="val-div-table-1">
					<div class="title">56</div>
					<br/>
					<div class="text">
						<xsl:value-of select="$CarrierCharge/rwb:Amount56"/>
					</div>
				</div>
				<div class="val-div-table-2">
					<div class="title">57</div>
					<br/>
					<div class="text">
						<xsl:value-of select="$CarrierCharge/rwb:Amount57"/>
					</div>
				</div>
				<div class="val-div-table-3">
					<div class="title">58</div>
					<br/>
					<div class="text">
						<xsl:value-of select="$CarrierCharge/rwb:Amount58"/>
					</div>
				</div>
				<div class="val-div-table-end">
					<div class="title">59</div>
					<br/>
					<div class="text">
						<xsl:value-of select="$CarrierCharge/rwb:Amount59"/>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
