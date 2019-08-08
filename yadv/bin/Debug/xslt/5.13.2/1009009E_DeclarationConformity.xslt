<?xml version="1.0" encoding="utf-8"?>

<!-- Бланк ТС регламентируется Решением Коллегии ЕЭК от 25 декабря 2012 г. № 293 -->
<!-- Бланк РОССТАНДАРТ регламентируется Постановлением Правительства РФ № 766 от 7 июня 1999 г. (утратил силу) + правки приказом Минэкономразвития от 24.11.2014 г. № 752 (http://www.qgc.ru/certifications/sootvetsvie/) -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.0" xmlns:catSert_ru="urn:customs.ru:Information:SertifDocuments:SertifCommonAggregateTypesCust:5.13.1" xmlns:declc="urn:customs.ru:Information:SertifDocuments:DeclarationConformity:5.13.2">
	<!-- Шаблон для типа DeclarationConformityType -->
	<xsl:template match="declc:DeclarationConformity">
		<html>
			<head>
				<style>
									body {
									background: #cccccc;
									}

									div.page {
									width: 210mm;
									/*height: 297mm;*/
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm;
									background: #ffffff;
									border: solid 1pt #000000;
									}

									.marg-top
									{
									margin-top:5mm;
									font-family: Arial, serif;
									font-size: 10pt;
									font-weight: bold;
									}
						
								   .first-page{
								   margin: 6pt;
								   width: 210mm;
								   background: #ffffff;
								   border: solid 1pt #000000;
								   }
						
								   @media print {
								   div.page, div.first-page {
								   border: none;
								   padding: 0;
								   }
								   }
						
								   .graph {
								   font-family: Arial;
								   font-size: 8pt;
								   }
						
								   .graph9 {
								   font-family: Arial, serif;
								   font-size: 9pt;}
						
								   .graph12 {
								   font-family: Arial, serif;
								   font-weight: bold;
								   font-size: 12pt;}
						
								   .graph10 {
								   font-family: Arial, serif;
								   font-size: 10pt;}
						
								   .graph8 {
								   font-family: Arial, serif;
								   font-size: 8pt;}
						
								   td {border: 0px solid gray;
								   font-family: Arial, serif;
								   }

									.value
									{
									border-bottom: solid 1px black;
									}

								   .underlined {
								   border-bottom: solid 1pt #000000;
								   }
						
								   .uplined {
								   border-top: solid 1pt #000000;
								   font-family: Arial, serif;
								   font-size: 8pt;
								   }
						
								   .remark {
								   text-align:right;
								   text-decoration: underline;
								   }
						
								   .status {
								   text-align:center;
								   color: red;
								   }
						
								   .bordered {
									border: 1px solid;
								   }
						
								   table.items {border-collapse: collapse;}
								   table.items td, table.items th {border: 1px solid black; padding: 2px;}
								   table.items th {background-color: WhiteSmoke;}
								</style>
			</head>
			<body>
				<div class="page">
					 <table style="width:190mm; margin:0 auto;">
						<tr>
							<td align="center" style="width: 30mm" rowspan="2">
								<xsl:choose>
									<xsl:when test="declc:DeclarationSign='0'">
										<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAMAAAAp4XiDAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAIGNIUk0AAHolAACAgwAA+f8AAIDoAABSCAABFVgAADqXAAAXb9daH5AAAAMAUExURQAAAP///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGd27GMAAAACdFJOU/8A5bcwSgAAAFFJREFUeNrsVkEOACAIgtb/v0y3mvPQ6mSmN9w4oDAlcVoNQSkdADQhDfIdRtZyK38qw2YOsbUU5WfKcrKMXZU6lbX9oryYSl/KeF6Z6FMaAwAdpQlx0OI7gAAAAABJRU5ErkJggg==" alt="" />
									</xsl:when>
									<xsl:when test="declc:DeclarationSign='1'">
										<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADoAAAAyCAYAAAAN6MhFAAAACXBIWXMAAAsTAAALEwEAmpwYAAABNmlDQ1BQaG90b3Nob3AgSUNDIHByb2ZpbGUAAHjarY6xSsNQFEDPi6LiUCsEcXB4kygotupgxqQtRRCs1SHJ1qShSmkSXl7VfoSjWwcXd7/AyVFwUPwC/0Bx6uAQIYODCJ7p3MPlcsGo2HWnYZRhEGvVbjrS9Xw5+8QMUwDQCbPUbrUOAOIkjvjB5ysC4HnTrjsN/sZ8mCoNTIDtbpSFICpA/0KnGsQYMIN+qkHcAaY6addAPAClXu4vQCnI/Q0oKdfzQXwAZs/1fDDmADPIfQUwdXSpAWpJOlJnvVMtq5ZlSbubBJE8HmU6GmRyPw4TlSaqo6MukP8HwGK+2G46cq1qWXvr/DOu58vc3o8QgFh6LFpBOFTn3yqMnd/n4sZ4GQ5vYXpStN0ruNmAheuirVahvAX34y/Axk/96FpPYgAAACBjSFJNAAB6JQAAgIMAAPn/AACA6AAAUggAARVYAAA6lwAAF2/XWh+QAAAFNklEQVR42tSaW2hcVRSGv0wnM8kk1iRWa6OmthLaVJraqkW81EuhKA0iIqk+1EpFBRWp+KCCmCdBpYggeK1oEY2+eMEaLdWCpFUx3mpqrJGGpl4i1SS22uYyJseH+Qc3hzNzzpnZZ2b8YTNz5pzZs/+9117rX2tPFdEiBrQAbcBZQC0wH0gBR4C/gaPAD8B+XUeCeIQkU8ASYCXQDpwBJIC5QBI4BkwBxzUJTcB3wHAUg6my3N9SYC1wnkgu1gr6TagD/AWMAIPA98BnwG6teEWgBdgC7AR+06BttLQIbwPWy0JKjjnACuB57TUn4jalPXw30FAqkguBrXIcThnaN8BNmmyi2s93AENlIuhu7wAX2iY5H9heIQTN9gdwiy2SlwD9FUjSbI8VS/IK4OcKJ+nI4xcsGK4CuoHTqHzMFEp0GfCsQXIG6AX6gDF5vBbgcgkDm5iQSJiQgmqUdPQTHKGJnqz42Krr3cDjwF4PLXom0AE8JIlXCA5JBfUBB4FxQx5WazynAouA5cBlUlxFK7xnDNvfJmFudpjwiGFLgC9C7KlpTdwGTVZQzV2lCLAB+NTo792wJNdJZDvADhehduA+7dsnPWTZioAS8Edgk8yyGNQDt8oCPg6bUvVqMKPAxca964BfPQa9HTjFeO5OH5LdUlY2sRK4R1lRIGwyBvSW8XmbT4h51CUsDuR4bmuUsk1mHWivdhsCerPx+Ys+q/SLvDRADfC6xzNPlTv+xA3106n3UzLdLE736aMZWAMMAJPAYdf9HuABC5WKlCzCKWClJ7JEVxveNe6y9yBJ84kczx8HuvRaDK4E7lI8TYf8bhLYG5e5XZonLs36dDQM7DFILjDuva2wUywWyyEWWhGZE5PXOjeP0vAzlZeVuiEVs1zv08BrlrbYiGs7hcVwDLjaR8bVAr8boSeLSeAJqaYsbjAmbQDYZ4loo1qhmBeXvMqHaplnJ3C9zHxM3nWPS1A8bFz3yyPbgKOSTY32e0pVw3wif0yvtVlndJLPj0yrqpcGnlbDQwJ2uzy0zbLl+9oeSamvDuARLYIXhhQiZ/XMSDygV62TuB71SABuBO71MP9pi0RHgU+M60Wa+FxEx13WRhz4M8CKArwKfKU4mdKPLQNW5fCGTREXxxM+OrjODGtx/I8Bsg7oIrWgaHP/mEU4Ae47bsWxSzlhPmVRCFaJLBERDaWQYkp6D0QwmHmqQJRDwFd5ET2mJDgK3KyMxjaafZxotft+9qIvIqLtwEalaDbxtcJZwsO715E5qJrKNQM9hkDf6IphxZQixyXKozLhwHs0q0t7jFWOWRxMA/CSUsFSe9+czmNAX+4wPv8AO0XmQ6oz2UZS2U19mC9t1qC2GJ+9ib2K+iTwIPbOOptUAXnDR0B4YpcG1aXrV7B/hLAPuDbsKrikZ6ecqCM/Ehrn8N/R4LfyYFGedXZpq7TmCRkJjWsdcD/wpaufHYV6rWuUNDeooyqix0Eyp9pHpL+nFQ0aVbXI/ifCq5LYU8z+v035nPM/aO8FDS9eeIHMCfcElY94MUQhc/ZyOxX0F5gcOGyro9VKZCv1tLve5qw1qBg2USEE95M5VYsMayzo32LaURXhFpRiT6QUsHuldkpBcIzMKfzScjiBpIL4c2T+zjYTwep9JJHQWpI0J6DuXKsspV0BvjlkH5NSZYPA58CHUkGzxQ4uKsVTA5wNXACcr3pvneJdSornhNLDNJk/Rg1Ju/aTOYIoT+JaIOaqSLZQK56Q907KLCfVflLdahD4J4qB/DsAO2c/m47WR3kAAAAASUVORK5CYII=" alt="" />
									</xsl:when>
								</xsl:choose>
							</td>
						   <td align="center" class="graph12" style="width: 160mm">
							  <br>
								  <xsl:if test="declc:DeclarationSign='0'">ТАМОЖЕННЫЙ СОЮЗ</xsl:if>
								  <xsl:if test="declc:DeclarationSign='1'">РОССТАНДАРТ</xsl:if>
							  </br>
							  <br>ДЕКЛАРАЦИЯ О СООТВЕТСТВИИ</br>
						   </td>
						</tr>
						<tr>
							<td class="status graph10">
								<xsl:if test="declc:Status">
									<xsl:choose>
										<xsl:when test="declc:Status='2'"> (действие приостановлено)</xsl:when>
										<xsl:when test="declc:Status='3'"> (действие временно приостановлено)</xsl:when>
										<xsl:when test="declc:Status='5'"> (действие прекращено)</xsl:when>
										<xsl:when test="declc:Status='7'"> (действие аннулировано)</xsl:when>
										<xsl:when test="declc:Status='8'"> (архивно)</xsl:when>
										<xsl:when test="declc:Status='9'"> (не опубликован)</xsl:when>
										<xsl:when test="declc:Status='10'"> (исключен из реестра)</xsl:when>
									</xsl:choose>
								</xsl:if>
							</td>
						</tr>
					</table>
					<br/>
					<!--table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<table cellpadding="5" style="width:190mm; margin: auto">	
						<tr>
							<td class="graph10">
								<b>Заявитель, </b>
								<xsl:if test="declc:Goods/declc:Contract">
									<xsl:text>уполномоченное представителем лицо, контракт № </xsl:text>
									<xsl:apply-templates select="declc:Goods/declc:Contract"/>
									<xsl:text>, </xsl:text>
								</xsl:if>
								<xsl:apply-templates select="declc:Declarant" mode="short"/>
							</td>
						</tr>
						<tr>
							<td class="graph10">
								<b>в лице </b>
								<xsl:apply-templates select="declc:Declarant/declc:Chief"/>
							</td>
						</tr>
						<tr>
							<td class="graph10">
								<b>заявляет, что </b>
								<xsl:for-each select="declc:Goods">
									<xsl:apply-templates select="." mode="short"/>
									<xsl:if test="position()!=last()"><br/></xsl:if>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td class="graph10">
								<b>соответствует требованиям </b>
								<xsl:for-each select="declc:DeclNormDocInfo">
									<xsl:apply-templates select="."/>
									<xsl:if test="position()!=last()">; </xsl:if>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td class="graph10">
								<b>Декларация о соответствии принята на основании </b>
								<xsl:for-each select="declc:Document">
									<xsl:value-of select="cat_ru:PrDocumentName"/>
									<xsl:text> </xsl:text>
									<xsl:if test="cat_ru:PrDocumentNumber">
										<xsl:text> № </xsl:text>
										<xsl:value-of select="cat_ru:PrDocumentNumber"/>
										<xsl:text> </xsl:text>
									</xsl:if>
									<xsl:if test="cat_ru:PrDocumentDate">
										<xsl:text>от </xsl:text>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td class="graph10">
								<b>Дополнительная информация </b>
								<xsl:for-each select="declc:OtherInfo">
									<xsl:value-of select="."/>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td class="graph10">
								<b>Декларация о соответствии действительна с даты регистрации по </b>
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="declc:EndDate"/>
								</xsl:call-template> 
								<b> включительно</b>
							</td>
						</tr>
						<tr style="height:4mm">
						   <td><br/></td>
						</tr>
					</table>
					 <xsl:for-each select="declc:DeclarantSignature">
						 <table style="width:190mm; margin: 0 auto">
								<tr>
								   <td align="center" class="graph10" style="width:35mm"/>
								   <td/>
								   <td align="center" class="graph10" style="width:150mm">
									  <xsl:value-of select="cat_ru:PersonSurname"/>
									  <xsl:text> </xsl:text>
									  <xsl:value-of select="cat_ru:PersonName"/>
									  <xsl:text> </xsl:text>
									  <xsl:value-of select="cat_ru:PersonMiddleName"/>
								   </td>
								</tr>
								<tr>
								   <td align="center" class="uplined">подпись</td>
								   <td/>
								   <td align="center" class="uplined">инициалы, фамилия руководителя организации (уполномоченного <br/>лица) или индивидуального предпринимателя</td>
								</tr>
								<tr>
								   <td align="center" class="graph10"><br/> М.П.</td>
								   <td/>
								   <td/>
								</tr>
						 </table>
					 </xsl:for-each>
					 <br/>
					<table style="width:190mm; margin:0 auto;">
						<tr>
							<td class="graph10">
								<b>Сведения о регистрации декларации о соответствии: </b>
							</td>
						</tr>
						<tr>
							<td class="graph10">
								Регистрационный номер декларации о соответствии: 
								<xsl:if test="declc:DeclarationSign='0'"> ТС </xsl:if>
								<xsl:apply-templates select="declc:RegistrationNumber"/>
							</td>
						</tr>
						<tr>
							<td class="graph10">
								Дата регистрации декларации о соответствии: 
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="declc:StartDate"/>
								</xsl:call-template> 
							</td>
						</tr>
					</table>
					<xsl:if test="declc:DeclarationSign='1'">
						<xsl:if test="declc:Register">
							<table style="width:190mm; margin:0 auto;">	
								<tr>
									<td class="graph10">
										Сведения об органе, зарегистрировавшем декларацию о соответствии:  
										<xsl:apply-templates select="declc:Register" mode="short"/> 
									</td>
								</tr>
							</table>	
						</xsl:if>
						<table style="width:190mm; margin: 0 auto">
							<xsl:for-each select="declc:RegisterSignature">
								<tr>
								   <td align="center" class="graph10" style="width:35mm"/>
								   <td/>
								   <td align="center" class="graph10" style="width:150mm">
									  <xsl:value-of select="cat_ru:PersonSurname"/>
									  <xsl:text> </xsl:text>
									  <xsl:value-of select="cat_ru:PersonName"/>
									  <xsl:text> </xsl:text>
									  <xsl:value-of select="cat_ru:PersonMiddleName"/>
								   </td>
								</tr>
								<tr>
								   <td align="center" class="uplined">подпись</td>
								   <td/>
								   <td align="center" class="uplined">инициалы, фамилия руководителя органа по сертификации</td>
								</tr>
							</xsl:for-each>
							<xsl:for-each select="declc:ExpertSignature">
								<tr>
								   <td align="center" class="graph10" style="width:35mm"/>
								   <td/>
								   <td align="center" class="graph10" style="width:150mm">
									  <xsl:value-of select="cat_ru:PersonSurname"/>
									  <xsl:text> </xsl:text>
									  <xsl:value-of select="cat_ru:PersonName"/>
									  <xsl:text> </xsl:text>
									  <xsl:value-of select="cat_ru:PersonMiddleName"/>
								   </td>
								</tr>
								<tr>
								   <td align="center" class="uplined">подпись</td>
								   <td/>
								   <td align="center" class="uplined">инициалы, фамилия эксперта</td>
								</tr>
							</xsl:for-each>
								<tr>
								   <td align="center" class="graph10" style="width:35mm"><br/> М.П.</td>
								   <td/>
								   <td/>
								</tr>
						</table>
					</xsl:if>
					<br/>
					<table style="width:190mm; margin:0 auto;">
						<xsl:for-each select="declc:SuspendedInfo">
							<xsl:if test="position()=1">
								<tr>
									<td colspan="5" class="graph">ПРИОСТАНОВЛЕНА</td>
								</tr>
							</xsl:if>
							<xsl:apply-templates select="."/>
						</xsl:for-each>
						<xsl:for-each select="declc:RevivedInfo">
							<xsl:if test="position()=1">
								<tr>
									<td colspan="5" class="graph">ВОЗОБНОВЛЕНА</td>
								</tr>
							</xsl:if>
							<xsl:apply-templates select="."/>
						</xsl:for-each>
						<xsl:for-each select="declc:DiscontinuedInfo">
							<xsl:if test="position()=1">
								<tr>
									<td colspan="5" class="graph">ПРЕКРАЩЕНА</td>
								</tr>
							</xsl:if>
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</table>
				</div>
				<xsl:if test="declc:BDRDID or declc:SchemaDeclaration or declc:DeclarationKind or declc:DeclarantSignature or declc:AppendInfo or declc:Document">
					<div class="page">
						 <table style="width:190mm; margin: auto;">
							<tr>
								<td align="center" class="graph12">
								  <br>ДОПОЛНИТЕЛЬНЫЕ СВЕДЕНИЯ</br>
							   </td>
							</tr>		
						</table>
						<br/>
						<xsl:if test="declc:BDRDID">
							<table style="width:190mm; margin: auto;">
								<tr>
									<td class="annot graph10" style="width:50%">Идентификатор документа по БД РД</td>
									<td class="value graph10" style="width:50%"><xsl:value-of select="declc:BDRDID"/></td>
								</tr>
							</table>
						</xsl:if>
						<table style="width:190mm; margin: auto;">
							<tr>
								<td class="annot graph10" style="width:50%">Статус декларации о соответствии</td>
								<td class="value graph10" style="width:50%">
									<xsl:choose>
										<xsl:when test="declc:Status='1'">ACTIVE - Действует</xsl:when>
										<xsl:when test="declc:Status='2'">SUSPENDED - Действие приостановлено</xsl:when>
										<xsl:when test="declc:Status='3'">PARTIALSUSPENSION - Действие временно приостановлено</xsl:when>
										<xsl:when test="declc:Status='4'">REVIVED - Действие возобновлено</xsl:when>
										<xsl:when test="declc:Status='5'">DISCONTINUED - Действие прекращено</xsl:when>
										<xsl:when test="declc:Status='6'">EXTENDED - Продлено</xsl:when>
										<xsl:when test="declc:Status='7'">CANCELED - Аннулировано</xsl:when>
										<xsl:when test="declc:Status='8'">ARCHIVED - Архивно</xsl:when>
										<xsl:when test="declc:Status='9'">NOTPUBLISHED - Не опубликован</xsl:when>
										<xsl:when test="declc:Status='10'">EXCLUDEDREG - Исключен из реестра)</xsl:when>
									</xsl:choose>
								</td>
							</tr>
						</table>
						<xsl:if test="declc:SchemaDeclaration">
							<table style="width:190mm; margin: auto;">
								<tr>
									<td class="annot graph10" style="width:50%">Схема декларирования соответствия</td>
									<td class="value graph10" style="width:50%"><xsl:value-of select="declc:SchemaDeclaration"/></td>
								</tr>
							</table>
						</xsl:if>
						<xsl:if test="declc:DeclarationKind">
							<table style="width:190mm; margin: auto;">
								<tr>
									<td class="annot graph10" style="width:50%">Тип реестра, содержащего декларацию</td>
									<td class="value graph10" style="width:50%">
										<xsl:choose>
											<xsl:when test="declc:DeclarationKind=0">
												<xsl:text>Реестр деклараций о соответствии продукции требованиям технических регламентов Таможенного Союза</xsl:text>
											</xsl:when>
											<xsl:when test="declc:DeclarationKind=1">
												<xsl:text>Реестр деклараций о соответствии продукции требованиям технических регламентов Российской Федерации</xsl:text>
											</xsl:when>
											<xsl:when test="declc:DeclarationKind=2">
												<xsl:text>Реестр деклараций о соответствии продукции требованиям Единого перечня Таможенного Союза</xsl:text>
											</xsl:when>
											<xsl:otherwise><xsl:value-of select="declc:DeclarationKind"/></xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
							</table>
						</xsl:if>
						<xsl:if test="declc:DeclarantSignature">
							<table style="width:190mm; margin: auto;">
								<tr>
									<td class="annot graph10" style="width:50%">Подпись заявителя</td>
									<td class="value graph10" style="width:50%"><xsl:apply-templates select="declc:DeclarantSignature"/></td>
								</tr>
							</table>
						</xsl:if>
						<xsl:if test="declc:AppendInfo">
							<table style="width:190mm; margin: auto;">
								<xsl:for-each select="declc:AppendInfo">
									<tr>
										<td class="annot graph10" style="width:50%">
											<xsl:if test="position()=1">Сведения о приложениях</xsl:if>
										</td>
										<td class="value graph10" style="width:50%"><xsl:apply-templates select="."/></td>
									</tr>
								</xsl:for-each>
							</table>
						</xsl:if>
						<div class="marg-top">Сведения о заявителе</div>
						<xsl:apply-templates select="declc:Declarant" mode="full"/>
						<div class="title marg-top">Сведения о продукции</div>
						<table style="width:190mm; margin: auto;">
							<xsl:for-each select="declc:Goods">
								<xsl:apply-templates select="." mode="full"/>
								<xsl:if test="position()!=last()">
									<tr>
										<td class="annot graph10" colspan="2"><br/></td>
									</tr>
								</xsl:if>
							</xsl:for-each>
						</table>
						<xsl:if test="declc:Document">
							<div class="title marg-top">Документы, послужившие основанием для подтверждения соответствия</div>
							<table style="width:190mm; margin: auto;">
								<xsl:for-each select="declc:Document">
									<xsl:apply-templates select="."/>
									<xsl:if test="position()!=last()">
										<tr>
											<td class="annot graph10" colspan="2"><br/></td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</table>
						</xsl:if>
					</div>
				</xsl:if>	
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<xsl:text>код объекта: </xsl:text>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<xsl:text> код справочника: </xsl:text>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<xsl:text>тел.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:if test="cat_ru:Phone">, </xsl:if>
			<xsl:text>факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax">, </xsl:if>
			<xsl:text>телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax or cat_ru:Telex">, </xsl:if>
			<xsl:text>e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails| catSert_ru:LegalAddress| catSert_ru:FactAddress">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:text> Вид адреса - </xsl:text>
			<xsl:value-of select="RUScat_ru:AddressKindCode"/>
			<xsl:text>:  </xsl:text>
		</xsl:if>
		<xsl:value-of select="RUScat_ru:PostalCode"/>
		<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">
			<xsl:if test="RUScat_ru:PostalCode">, </xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<xsl:if test="RUScat_ru:CounryName">(<xsl:value-of select="RUScat_ru:CountryCode"/>) </xsl:if>
				<xsl:value-of select="RUScat_ru:CounryName"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Region"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region">, </xsl:if>
			<xsl:value-of select="RUScat_ru:District"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Town"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town">, </xsl:if>
			<xsl:value-of select="RUScat_ru:City"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City">, </xsl:if>
			<xsl:value-of select="RUScat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse">, </xsl:if>
			<xsl:value-of select="RUScat_ru:House"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Room"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room">, </xsl:if>
			<xsl:value-of select="RUScat_ru:AddressText"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText">, </xsl:if>
			<xsl:text> номер а/я: </xsl:text>
			<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
		</xsl:if>
		<!--xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:AOID or RUScat_ru:TerritoryCode"-->
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO">
			<xsl:text> (</xsl:text>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/></xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/></xsl:if>
			<!--xsl:if test="RUScat_ru:KLADR"> Код КЛАДР: <xsl:value-of select="RUScat_ru:KLADR"/></xsl:if>
			<xsl:if test="RUScat_ru:AOGUID"> Глобальный ИД по ФИАС: <xsl:value-of select="RUScat_ru:AOGUID"/></xsl:if>
			<xsl:if test="RUScat_ru:AOID"> Уникальный ИД по ФИАС: <xsl:value-of select="RUScat_ru:AOID"/></xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/></xsl:if-->
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UITN40Type -->
	<xsl:template match="RUScat_ru:UITN">
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<xsl:value-of select="cat_ru:CategoryCode"/>
		<xsl:text>-</xsl:text>
		<xsl:value-of select="cat_ru:KATOCode"/>
		<xsl:if test="cat_ru:RNN">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:RNN"/>
		</xsl:if>
		<!--xsl:if test="cat_ru:ITNReserv">
			<xsl:if test="cat_ru:RNN"><xsl:text>/00000000</xsl:text></xsl:if>
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:ITNReserv"/>
		</xsl:if-->
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text>ИНН / ПИН: </xsl:text>
			<xsl:value-of select="cat_ru:KGINN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<xsl:text>ОКПО: </xsl:text>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text>УНН: </xsl:text>
			<xsl:value-of select="cat_ru:UNN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<xsl:text>НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<xsl:text>Номер справки об НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text>УНП: </xsl:text>
			<xsl:value-of select="cat_ru:UNP"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text>Идентификационный номер физ.лица: </xsl:text>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>ОГРН/ОГРНИП: </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text>ИНН: </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text>КПП: </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text>БИН: </xsl:text>
			<xsl:value-of select="cat_ru:BIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text>ИИН: </xsl:text>
			<xsl:value-of select="cat_ru:IIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<xsl:text>ИТН: </xsl:text>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа declc:AppendInfoType -->
	<xsl:template match="declc:AppendInfo">
		<xsl:if test="declc:AppendNumber">
			<xsl:text>прил. № </xsl:text>
			<xsl:value-of select="declc:AppendNumber"/>
			<xsl:if test="declc:AppendFormNumber"> (бланк <xsl:value-of select="declc:AppendFormNumber"/>)</xsl:if>
			<xsl:text> </xsl:text>			
		</xsl:if>	
		<xsl:if test="declc:Append">
			<xsl:text>сведения о приложениях: </xsl:text>
			<xsl:for-each select="declc:Append"><xsl:value-of select="."/></xsl:for-each>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="declc:CertInfo">
			<xsl:text>прочие сведения о декларации: </xsl:text>
			<xsl:for-each select="declc:CertInfo"><xsl:value-of select="."/></xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа declc:AppendsType -->
	<xsl:template match="declc:Appends">
		<xsl:if test="declc:AppendNumber">
			<xsl:text>прил. № </xsl:text>
			<xsl:value-of select="declc:AppendNumber"/>
			<xsl:if test="declc:AppendFormNumber"> (бланк <xsl:value-of select="declc:AppendFormNumber"/>)</xsl:if>
		</xsl:if>	
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="declc:Chief">
		<xsl:if test="cat_ru:PersonPost">
			<xsl:value-of select="cat_ru:PersonPost"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:PersonMiddleName"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="declc:Contract| declc:ContractWithFM| declc:ShippingDocuments">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа declc:DeclNormDocInfoType -->
	<xsl:template match="declc:DeclNormDocInfo">
		<xsl:for-each select="declc:DeclNormDoc">
			<xsl:value-of select="."/>
		</xsl:for-each>
		<xsl:if test="declc:DeclNormDoc">
			<xsl:text> </xsl:text>
			<xsl:for-each select="declc:DeclNormDoc">
				<xsl:value-of select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="declc:DocumentInfo">
			<xsl:text> </xsl:text>
			<xsl:for-each select="declc:DocumentInfo">
				<xsl:value-of select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="declc:Appends">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="declc:Appends"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа declc:SubdivisionInfoType -->
	<xsl:template match="declc:Branch" mode="full">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:OrganizationName and cat_ru:ShortName"> (</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
		<xsl:if test="cat_ru:OrganizationName and cat_ru:ShortName">)</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures and (cat_ru:OrganizationName or cat_ru:ShortName)">
			<xsl:text>; </xsl:text>
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<xsl:text>; код страны: </xsl:text>
			<xsl:value-of select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode or RUScat_ru:BusinessEntityTypeName">
			<xsl:text>; организационно-правовая форма, в которой зарегистрирован хозяйствующий субъект: </xsl:text>
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
			<xsl:if test="RUScat_ru:BusinessEntityTypeName">
				<xsl:text> </xsl:text>
				<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
			</xsl:if>
		</xsl:if>		
		<xsl:if test="RUScat_ru:UITN">
			<xsl:text>; таможенный номер, присвоенный юр. или физ. лицу: </xsl:text>
			<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:text>; адрес: </xsl:text>
			<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<xsl:text>; контакты: </xsl:text>
			<xsl:apply-templates select="RUScat_ru:CommunicationDetails"/>
		</xsl:if>
		<xsl:if test="declc:AppendFormNumber">
			<xsl:text>; номер бланка приложения: </xsl:text>
			<xsl:value-of select="declc:AppendFormNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа организации краткий -->
	<xsl:template match="declc:Declarant| declc:Manufacturer| declc:Branch| declc:Register| declc:OrgRegAuthority" mode="short">
		<xsl:if test="declc:ManufacturerOrgModeCode">
			<xsl:choose>
				<xsl:when test="declc:ManufacturerOrgModeCode='Ul'">Юридическое лицо </xsl:when>
				<xsl:when test="declc:ManufacturerOrgModeCode='Fl'">Физическое лицо </xsl:when>
				<xsl:when test="declc:ManufacturerOrgModeCode='Al'">Иностранное ЮЛ </xsl:when>
			</xsl:choose>
		</xsl:if>
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:OrganizationName and cat_ru:ShortName"> (</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
		<xsl:if test="cat_ru:OrganizationName and cat_ru:ShortName">)</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures and (cat_ru:OrganizationName or cat_ru:ShortName)">
			<xsl:text>; </xsl:text>
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="catSert_ru:OKPOID">
			<xsl:text>; ОКПО: </xsl:text>
			<xsl:value-of select="catSert_ru:OKPOID"/>
		</xsl:if>
		<xsl:if test="declc:OrgRegistryDate">
			<xsl:text>; дата регистрации организации/ИП: </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="declc:OrgRegistryDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="declc:RegistrationAuthority or declc:RegistrationDate or declc:RegistrationNumber">
			<xsl:text>; аттестат аккредитации органа по сертификации </xsl:text>
			<xsl:if test="declc:RegistrationNumber">№ <xsl:value-of select="declc:RegistrationNumber"/></xsl:if>
			<xsl:if test="declc:RegistrationDate">
				<xsl:text> от </xsl:text>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="declc:RegistrationDate"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:if test="declc:RegistrationAuthority"> выдан <xsl:value-of select="declc:RegistrationAuthority"/></xsl:if>
		</xsl:if>
		<xsl:if test="catSert_ru:LegalAddress">
			<xsl:text>; юр. адрес: </xsl:text>
			<xsl:for-each select="catSert_ru:LegalAddress">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">; </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catSert_ru:FactAddress">
			<xsl:text>; факт. адрес: </xsl:text>
			<xsl:for-each select="catSert_ru:FactAddress">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">; </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catSert_ru:Phone">
			<xsl:text>; тел.: </xsl:text>
			<xsl:for-each select="catSert_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="catSert_ru:Fax">
			<xsl:text>; факс: </xsl:text>
			<xsl:for-each select="catSert_ru:Fax">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catSert_ru:Email">
			<xsl:text>; e-mail: </xsl:text>
			<xsl:for-each select="catSert_ru:Email">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="declc:Branch">
			<br/>Филиалы:<br/>
			<xsl:for-each select="declc:Branch">
				<xsl:apply-templates select="." mode="short"/>
				<xsl:if test="position()!=last()"><br/></xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа организации полный -->
	<xsl:template match="declc:Declarant| declc:Manufacturer| declc:Register" mode="full">
		<table style="width:190mm; margin: auto">
			<tr>
				<td class="annot graph10" style="width:50%">Наименование организации</td>
				<td class="value graph10" style="width:50%">
					<xsl:value-of select="cat_ru:OrganizationName"/>
					<xsl:if test="cat_ru:OrganizationName and cat_ru:ShortName"> (</xsl:if>
						<xsl:value-of select="cat_ru:ShortName"/>
					<xsl:if test="cat_ru:OrganizationName and cat_ru:ShortName">)</xsl:if>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures and (cat_ru:OrganizationName or cat_ru:ShortName)">
			<table style="width:190mm; margin: auto">
				<tr>
					<td class="annot graph10" style="width:50%">Сведения об организации</td>
					<td class="value graph10" style="width:50%">
						<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catSert_ru:OKPOID">
			<table style="width:190mm; margin: auto">
				<tr>
					<td class="annot graph10" style="width:50%">Код организации по ОКПО</td>
					<td class="value graph10" style="width:50%"><xsl:value-of select="catSert_ru:OKPOID"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catSert_ru:LegalAddress">
			<table style="width:190mm; margin: auto">
				<xsl:for-each select="catSert_ru:LegalAddress">
					<tr>
						<td class="annot graph10" style="width:50%"><xsl:if test="position()=1">Юридический адрес</xsl:if></td>
						<td class="value graph10" style="width:50%"><xsl:apply-templates select="."/></td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
		<xsl:if test="catSert_ru:FactAddress">
			<table style="width:190mm; margin: auto">
				<xsl:for-each select="catSert_ru:FactAddress">
					<tr>
						<td class="annot graph10" style="width:50%"><xsl:if test="position()=1">Фактический адрес</xsl:if></td>
						<td class="value graph10" style="width:50%"><xsl:apply-templates select="."/></td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
		<xsl:if test="catSert_ru:Phone or catSert_ru:Fax or catSert_ru:Email">
			<table style="width:190mm; margin: auto">
				<tr>
					<td class="annot graph10" style="width:50%">Контактные данные</td>
					<td class="value graph10" style="width:50%">
						<xsl:if test="catSert_ru:Phone">
							<xsl:text> тел.: </xsl:text>
							<xsl:for-each select="catSert_ru:Phone">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">, </xsl:if>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="catSert_ru:Fax">
							<xsl:text> факс: </xsl:text>
							<xsl:for-each select="catSert_ru:Fax">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">, </xsl:if>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="catSert_ru:Email">
							<xsl:text> e-mail: </xsl:text>
							<xsl:for-each select="catSert_ru:Email">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">, </xsl:if>
							</xsl:for-each>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="declc:OrgRegistryDate">
			<table style="width:190mm; margin: auto">
				<tr>
					<td class="annot graph10" style="width:50%">Дата регистрации организации или ИП</td>
					<td class="value graph10" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="declc:OrgRegistryDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="declc:Chief">
			<table style="width:190mm; margin: auto">
				<tr>
					<td class="annot graph10" style="width:50%">Руководитель организации</td>
					<td class="value graph10" style="width:50%"><xsl:apply-templates select="declc:Chief"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="declc:OrgRegAuthority">
			<table style="width:190mm; margin: auto">
				<tr>
					<td class="annot graph10" style="width:50%">Орган регистрации юридического лица или ИП</td>
					<td class="value graph10" style="width:50%">
						<xsl:apply-templates select="declc:OrgRegAuthority" mode="short"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="declc:OPF">
			<table style="width:190mm; margin: auto">
				<tr>
					<td class="annot graph10" style="width:50%">Организационно-правовая форма</td>
					<td class="value graph10" style="width:50%"><xsl:value-of select="declc:OPF"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="declc:Egr">
			<table style="width:190mm; margin: auto">
				<tr>
					<td class="annot graph10" style="width:50%">Сведения о государственной регистрации</td>
					<td class="value graph10" style="width:50%"><xsl:value-of select="declc:Egr"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="declc:DeclarantModeCode">
			<table style="width:190mm; margin: auto">
				<tr>
					<td class="annot graph10" style="width:50%">Тип лица</td>
					<td class="value graph10" style="width:50%">
						<xsl:choose>
							<xsl:when test="declc:DeclarantModeCode='Ul'">Юридическое лицо</xsl:when>
							<xsl:when test="declc:DeclarantModeCode='Fl'">Физическое лицо</xsl:when>
							<xsl:when test="declc:DeclarantModeCode='Al'">Иностранное ЮЛ</xsl:when>
							<xsl:when test="declc:DeclarantModeCode='Fp'">Индивидуальный предприниматель</xsl:when>
							<xsl:when test="declc:DeclarantModeCode='Aa'">Уполномоченное иностр. изг. лицо</xsl:when>
							<xsl:otherwise><xsl:value-of select="declc:DeclarantModeCode"/></xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="declc:ManufacturerOrgModeCode">
			<table style="width:190mm; margin: auto">
				<tr>
					<td class="annot graph10" style="width:50%">Тип лица</td>
					<td class="value graph10" style="width:50%">
						<xsl:choose>
							<xsl:when test="declc:ManufacturerOrgModeCode='Ul'">Юридическое лицо</xsl:when>
							<xsl:when test="declc:ManufacturerOrgModeCode='Fl'">Физическое лицо</xsl:when>
							<xsl:when test="declc:ManufacturerOrgModeCode='Al'">Иностранное ЮЛ</xsl:when>
							<xsl:otherwise><xsl:value-of select="declc:ManufacturerOrgModeCode"/></xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="declc:Organ">
			<table style="width:190mm; margin: auto">
				<tr>
					<td class="annot graph10" style="width:50%">Наименование органа, зарегистрировавшего организацию в качестве юридического лица</td>
					<td class="value graph10" style="width:50%"><xsl:value-of select="declc:Organ"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="declc:DateOGRN">
			<table style="width:190mm; margin: auto">
				<tr>
					<td class="annot graph10" style="width:50%">Дата регистрации</td>
					<td class="value graph10" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="declc:DateOGRN"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="declc:RegistrationAuthority or declc:RegistrationDate or declc:RegistrationNumber">
			<table style="width:190mm; margin: auto">
				<tr>
					<td class="annot graph10" style="width:50%">Аттестат аккредитации органа</td>
					<td class="value graph10" style="width:50%">
						<xsl:if test="declc:RegistrationNumber">№ <xsl:value-of select="declc:RegistrationNumber"/></xsl:if>
						<xsl:if test="declc:RegistrationDate">
							<xsl:text> от </xsl:text>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="declc:RegistrationDate"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="declc:RegistrationAuthority"> выдан <xsl:value-of select="declc:RegistrationAuthority"/></xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="declc:ApplicantType">
			<table style="width:190mm; margin: auto">
				<tr>
					<td class="annot graph10" style="width:50%">Тип заявителя</td>
					<td class="value graph10" style="width:50%">
						<xsl:choose>
							<xsl:when test="declc:ApplicantType=1">Изготовитель</xsl:when>
							<xsl:when test="declc:ApplicantType=2">Поставщик</xsl:when>
							<xsl:when test="declc:ApplicantType=3">Продавец</xsl:when>
							<xsl:when test="declc:ApplicantType=4">Уполномоченное изготовителем лицо</xsl:when>
							<xsl:when test="declc:ApplicantType=5">Исполнитель</xsl:when>
							<xsl:otherwise><xsl:value-of select="declc:ApplicantType"/> </xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="declc:ContractWithFM">
			<table style="width:190mm; margin: auto">
				<tr>
					<td class="annot graph10" style="width:50%">Данные о договоре с иностранным изготовителем</td>
					<td class="value graph10" style="width:50%"><xsl:apply-templates select="declc:ContractWithFM"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="declc:Branch">
			<table style="width:190mm; margin: auto">
				<xsl:for-each select="declc:Branch">
					<tr>
						<td class="annot graph10" style="width:50%"><xsl:if test="position()=1">Филиал(ы)</xsl:if></td>
						<td class="value graph10" style="width:50%"><xsl:apply-templates select="." mode="full"/></td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonSignatureType -->
	<xsl:template match="declc:DeclarantSignature">
		<xsl:if test="cat_ru:PersonPost">
			<xsl:value-of select="cat_ru:PersonPost"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:PersonMiddleName"/>
		</xsl:if>
		<xsl:if test="cat_ru:IssueDate">
			<xsl:text> Дата подписания: </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа declc:DocManufacturedInfoType -->
	<xsl:template match="declc:DocManufacturedInfo">
		<xsl:for-each select="declc:NormDocs">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
		<xsl:if test="declc:NormDocs and declc:TechReg">, </xsl:if>
		<xsl:if test="declc:TechReg">тех.регламент: </xsl:if>
		<xsl:for-each select="declc:TechReg">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
		<xsl:if test="(declc:NormDocs or declc:TechReg) and declc:TechRegOtherInfo">, </xsl:if>
		<xsl:if test="declc:TechRegOtherInfo">доп.сведения о тех.регламентах: </xsl:if>
		<xsl:for-each select="declc:TechRegOtherInfo">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа declc:GroundDocsType -->
	<xsl:template match="declc:Document">
		<tr>
			<td class="value graph10" colspan="2">
				<i>
				<xsl:if test="cat_ru:PrDocumentName or cat_ru:PrDocumentNumber or cat_ru:PrDocumentDate">
					<xsl:if test="cat_ru:PrDocumentName"><xsl:value-of select="cat_ru:PrDocumentName"/></xsl:if>
					<xsl:if test="cat_ru:PrDocumentNumber"> № <xsl:value-of select="cat_ru:PrDocumentNumber"/> </xsl:if>
					<xsl:if test="cat_ru:PrDocumentDate">
						<xsl:text> от </xsl:text>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:text> </xsl:text>
				</xsl:if>
				<xsl:if test="declc:DocumentsFullName">
					<xsl:value-of select="declc:DocumentsFullName"/>
				</xsl:if>
				</i>
			</td>
		</tr>	
		<xsl:if test="declc:Shema">
			<tr>
				<td class="annot graph10" style="width:50%">Схема декларирования</td>
				<td class="value graph10" style="width:50%"><xsl:value-of select="declc:Shema"/></td>
			</tr>	
		</xsl:if>
		<xsl:if test="declc:BasisProduce">
			<tr>
				<td class="annot graph10" style="width:50%">Основание выдачи декларации (сведения о протоколах испытаний)</td>
				<td class="value graph10" style="width:50%">
					<xsl:for-each select="declc:BasisProduce"><xsl:value-of select="."/></xsl:for-each>
				</td>
			</tr>	
		</xsl:if>
		<xsl:if test="declc:OrganizationName or declc:OrganizationNumber">
			<tr>
				<td class="annot graph10" style="width:50%">Кем выдан документ (наименование органа производившего испытания)</td>
				<td class="value graph10" style="width:50%">
					<xsl:value-of select="declc:OrganizationName"/>
					<xsl:if test="declc:OrganizationNumber"> рег.номер органа: <xsl:value-of select="declc:OrganizationNumber"/></xsl:if>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="declc:BeginDate or declc:EndDate">
			<tr>
				<td class="annot graph10" style="width:50%">Период действия аттестата</td>
				<td class="value graph10" style="width:50%">
					<xsl:if test="declc:BeginDate">с </xsl:if>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="declc:BeginDate"/>
					</xsl:call-template>
					<xsl:if test="declc:BeginDate"> по </xsl:if>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="declc:EndDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="declc:OrganizationAddress">
			<tr>
				<td class="annot graph10" style="width:50%">Адрес организации</td>
				<td class="value graph10" style="width:50%"><xsl:apply-templates select="declc:OrganizationAddress"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="declc:Documents">
			<tr>
				<td class="annot graph10" style="width:50%">Прочие документы, послужившие основанием выдачи сертификата</td>
				<td class="value graph10" style="width:50%">
					<xsl:for-each select="declc:Documents"><xsl:value-of select="."/></xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="declc:OtherInfo">	
			<tr>
				<td class="annot graph10" style="width:50%">Дополнительная информация</td>
				<td class="value graph10" style="width:50%">
					<xsl:for-each select="declc:OtherInfo"><xsl:value-of select="."/></xsl:for-each>
				</td>
			</tr>
		</xsl:if>	
	</xsl:template>
	<!-- Шаблон для типа declc:GoodsType -->
	<xsl:template match="declc:Goods" mode="short">
		<br/>
		<i><xsl:text>Товар: </xsl:text>
		<xsl:choose>
			<xsl:when test="declc:SeriesSign=1">"единичное изделие" </xsl:when>
			<xsl:when test="declc:SeriesSign=2">"партия" </xsl:when>
			<xsl:when test="declc:SeriesSign=3">"серийный выпуск" </xsl:when>
		</xsl:choose>
		<xsl:for-each select="declc:GoodsDescription"><xsl:value-of select="."/></xsl:for-each>
		<xsl:if test="declc:GoodsTNVEDCode">
			<xsl:text>; код по ТН ВЭД ЕАЭС: </xsl:text>
			<xsl:for-each select="declc:GoodsTNVEDCode">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:text>; </xsl:text>
		</i><br/>
		<xsl:for-each select="declc:GoodsInformation">
			<xsl:apply-templates select="."/>
			<xsl:if test="position()!=last()"><br/></xsl:if>
		</xsl:for-each>
		<br/>
		<xsl:for-each select="declc:Manufacturer">
			<xsl:text>Изготовитель: </xsl:text>
			<xsl:apply-templates select="." mode="short"/>
			<xsl:if test="position()!=last()"><br/></xsl:if>
		</xsl:for-each>
		<xsl:if test="declc:DocManufacturedInfo">
			<br/><xsl:text>продукция изготовлена на основании: </xsl:text>
			<xsl:for-each select="declc:DocManufacturedInfo">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="declc:Goods" mode="full">
		<tr>
			<td class="value graph10" colspan="2">
				<i>
				<xsl:if test="declc:AppendNumber">
					<xsl:text>прил. № </xsl:text>
					<xsl:value-of select="declc:AppendNumber"/>
					<xsl:if test="declc:AppendFormNumber"> (бланк <xsl:value-of select="declc:AppendFormNumber"/>)</xsl:if>
					<xsl:text> </xsl:text>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="declc:SeriesSign=1">"единичное изделие" </xsl:when>
					<xsl:when test="declc:SeriesSign=2">"партия" </xsl:when>
					<xsl:when test="declc:SeriesSign=3">"серийный выпуск" </xsl:when>
				</xsl:choose>
				<xsl:for-each select="declc:GoodsDescription"><xsl:value-of select="."/></xsl:for-each>
				</i>
			</td>
		</tr>
		<xsl:if test="declc:ProductCode">
			<tr>	
				<td class="annot graph10" style="width:50%">Код продукции по ОК005 - Общероссийскому классификатору продукции</td>
				<td class="value graph10" style="width:50%">
					<xsl:for-each select="declc:ProductCode">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">, </xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="declc:GoodsTNVEDCode">
			<tr>	
				<td class="annot graph10" style="width:50%">Код товара по ТН ВЭД ЕАЭС</td>
				<td class="value graph10" style="width:50%">
					<xsl:for-each select="declc:GoodsTNVEDCode">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">, </xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="declc:TypeDeclaration">
			<tr>	
				<td class="annot graph10" style="width:50%">Сведения о типе объекта декларирования</td>
				<td class="value graph10" style="width:50%"><xsl:apply-templates select="declc:TypeDeclaration"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="declc:Contract">
			<tr>	
				<td class="annot graph10" style="width:50%">Сведения о контракте</td>
				<td class="value graph10" style="width:50%"><xsl:apply-templates select="declc:Contract"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="declc:Contract">
			<tr>	
				<td class="annot graph10" style="width:50%">Сведения о документах, соответствие которым подтверждено декларацией</td>
				<td class="value graph10" style="width:50%">
				<xsl:for-each select="declc:DocsInfo"><xsl:value-of select="."/></xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="declc:OtherInfo">
			<tr>	
				<td class="annot graph10" style="width:50%">Дополнительная информация</td>
				<td class="value graph10" style="width:50%">
					<xsl:for-each select="declc:OtherInfo"><xsl:value-of select="."/></xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="declc:GoodsOKPD2">
			<tr>	
				<td class="annot graph10" style="width:50%">Код продукции по ОКПД2</td>
				<td class="value graph10" style="width:50%">
					<xsl:for-each select="declc:GoodsOKPD2">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">, </xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<tr>	
			<td class="annot graph10" colspan="2"><br/></td>
		</tr>
		<xsl:for-each select="declc:Manufacturer">
			<tr>	
				<td class="annot graph10" align="center" colspan="2">
					Сведения о изготовителе # <xsl:value-of select="position()"/>
				</td>
			</tr>
			<tr>	
				<td class="annot graph10" align="center" colspan="2">
					<xsl:apply-templates select="." mode="full"/>
				</td>
			</tr>	
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа declc:GoodsInformationType -->
	<xsl:template match="declc:GoodsInformation">
		<xsl:if test="declc:TradeMark">
			<xsl:text>тов. знак: </xsl:text>
			<xsl:value-of select="declc:TradeMark"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="declc:GoodsMark">
			<xsl:text>марка: </xsl:text>
			<xsl:value-of select="declc:GoodsMark"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="declc:GoodsMarking">
			<xsl:text>артикул: </xsl:text>
			<xsl:value-of select="declc:GoodsMarking"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="declc:GoodsStandard">
			<xsl:text>стандарт: </xsl:text>
			<xsl:value-of select="declc:GoodsStandard"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="declc:GoodsSort">
			<xsl:text>сорт: </xsl:text>
			<xsl:value-of select="declc:GoodsSort"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="declc:Dimensions">
			<xsl:text>размеры: </xsl:text>
			<xsl:value-of select="declc:Dimensions"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="declc:GoodsKind">
			<xsl:text>вид: </xsl:text>
			<xsl:value-of select="declc:GoodsKind"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="declc:OrganizationAddress">
		<xsl:value-of select="cat_ru:PostalCode"/>
		<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">
			<xsl:if test="cat_ru:PostalCode">, </xsl:if>
			<xsl:if test="cat_ru:CountryCode">
				<xsl:if test="cat_ru:CounryName">(<xsl:value-of select="cat_ru:CountryCode"/>) </xsl:if>
				<xsl:value-of select="cat_ru:CounryName"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:if test="cat_ru:PostalCode or cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="cat_ru:Region"/>
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:if test="cat_ru:PostalCode or cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
			<xsl:value-of select="cat_ru:City"/>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:if test="cat_ru:PostalCode or cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
			<xsl:value-of select="cat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="cat_ru:TerritoryCode">
			<xsl:if test="cat_ru:PostalCode or cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City or cat_ru:StreetHouse">, </xsl:if>
			<xsl:value-of select="cat_ru:TerritoryCode"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа declc:RegistrationNumberType -->
	<xsl:template match="declc:RegistrationNumber">
		<xsl:if test="declc:CustomsCountryCode">
			<xsl:value-of select="declc:CustomsCountryCode"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:text>№ </xsl:text>
		<xsl:value-of select="declc:SerialNumber"/>
	</xsl:template>
	<!-- Шаблон для типа declc:TypeDeclarationType -->
	<xsl:template match="declc:TypeDeclaration">
		<xsl:if test="declc:Number">
			<xsl:text>номер партии/изделия: </xsl:text>
			<xsl:value-of select="declc:Number"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="declc:Size">
			<xsl:text>размер партии: </xsl:text>
			<xsl:value-of select="declc:Size"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="declc:Quantity">
			<xsl:text>кол-во товара в партии: </xsl:text>
			<xsl:value-of select="translate(declc:Quantity, '.', ',')"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="declc:ShippingDocuments">
			<xsl:text>товаросопроводительные документы: </xsl:text>
			<xsl:for-each select="declc:ShippingDocuments">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="declc:SuspendedInfo| declc:RevivedInfo| declc:DiscontinuedInfo">
		<tr>
			<td align="left" class="graph" style="width:50mm;">
			  <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;№ </xsl:text>
			  <xsl:value-of select="declc:Number"/>
			  <xsl:if test="declc:DateNumber">
				  <xsl:text> от </xsl:text>
				  <xsl:call-template name="russian_date">
					  <xsl:with-param name="dateIn" select="declc:DateNumber"/>
				  </xsl:call-template>
			  </xsl:if>
			</td>
			<td align="left" class="graph" style="width:40mm;">
				<xsl:if test="declc:Date|declc:DateBegin">
					<xsl:text>c</xsl:text>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
					<xsl:call-template name="russian_date">
					 <xsl:with-param name="dateIn" select="declc:Date|declc:DateBegin"/>
				  </xsl:call-template>
			  </xsl:if>
			</td>
			<td align="left" class="graph" style="width:40mm;">
				<xsl:if test="declc:DateEnd">
				по<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
				 <xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="declc:DateEnd"/>
				 </xsl:call-template>
			  </xsl:if>
			</td>
			<td align="left" class="graph" style="width:60mm;">
				<xsl:apply-templates select="declc:ReasonDescription"/>
				<xsl:choose>
					<xsl:when test="declc:ReasonCode='1'"> (по заявлению)</xsl:when>
					<xsl:when test="declc:ReasonCode='2'"> (по предписанию)</xsl:when>
				</xsl:choose>
			</td>
		</tr>
    </xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
   <xsl:template name="Date">
		<xsl:value-of select="substring (., 9, 2)"/> 
		<xsl:variable name="month" select="substring(., 6, 2)"/>
		<xsl:choose>
			<xsl:when test="$month=1">января</xsl:when>
			<xsl:when test="$month=2">февраля</xsl:when>
			<xsl:when test="$month=3">марта</xsl:when>
			<xsl:when test="$month=4">апреля</xsl:when>
			<xsl:when test="$month=5">мая</xsl:when>
			<xsl:when test="$month=6">июня</xsl:when>
			<xsl:when test="$month=7">июля</xsl:when>
			<xsl:when test="$month=8">августа</xsl:when>
			<xsl:when test="$month=9">сентября</xsl:when>
			<xsl:when test="$month=10">октября</xsl:when>
			<xsl:when test="$month=11">ноября</xsl:when>
			<xsl:when test="$month=12">декабря</xsl:when>
		</xsl:choose> 					
		<xsl:value-of select="substring(., 1, 4)"/> г.
	</xsl:template>
</xsl:stylesheet>
