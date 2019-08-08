<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rstvha="urn:customs.ru:Information:SQDocuments:RosstandartVehicleApproval:5.13.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
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
   <xsl:template name="date_time">
      <xsl:param name="dateTimeIn"/>
      <xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
      </xsl:call-template>
      <xsl:text> </xsl:text>
      <xsl:value-of select="substring($dateTimeIn,12,5)"/>
   </xsl:template>
   <xsl:template match="rstvha:RosstandartVehicleApproval">
      <html>
         <head>
            <title>Одобрение транспортного средства</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
			body {
				background: #cccccc;
			}

			div.page {
				width: 210mm;
				height: 297mm;
				margin: auto;
				margin-top: 6pt;
				margin-bottom: 6pt;
				padding: 10mm;
				padding-left: 20mm;
				background: #ffffff;
				border: solid 1pt #000000;
			}
			
			div.album_page {
				width: 297mm;
				height: 210mm;
				margin: auto;
				margin-top: 6pt;
				margin-bottom: 6pt;
				padding: 10mm;
				padding-left: 20mm;
				background: #ffffff;
				border: solid 1pt #000000;
			}

			h2 {
				text-align:center;
				font: 20 ;
				font-family: Arial, serif;
			}
			
			.remark {
				text-align:right;
				font: 15;
				font-family: Arial, serif;
				text-decoration: underline;
			}
			
			.header {
				
				margin-top:20px;
				font: bold;
				
			}
			
			 table {
				width: 100%;
				border: 0;
				empty-cells: show;
				border-collapse: collapse;
				margin-top: 1px;
			}

			td {
				border: 1px solid gray;
				font-family: Courier, serif;

				vertical-align:top;
			}
			
			.low {
				font: 12;
				font-family: Arial, serif;
			}
			
			.auxiliary tbody tr td {
				border: 0;
			}
		</style>
         </head>
         <body>
            <div class="page">
               <h2>Одобрение транспортного средства</h2>
               <div class="remark">
                  <xsl:choose>
                     <xsl:when test="rstvha:TCtypeResult = 0 or rstvha:TCtypeResult = 'false' or rstvha:TCtypeResult = 'f' ">  Не одобрено  </xsl:when>
                     <xsl:when test="rstvha:TCtypeResult = 1 or rstvha:TCtypeResult = 'true' or rstvha:TCtypeResult = 't' ">  Одобрено  </xsl:when>
                  </xsl:choose>
               </div>
               <xsl:if test="rstvha:TCtypeApprovalsAddition">
                  <table border="0" class="auxiliary" style="margin-top:10px">
                     <tbody>
                        <tr>
                           <td class="low" style="width:25mm">Примечание. </td>
                           <td align="left" class="low">
                              <xsl:value-of select="rstvha:TCtypeApprovalsAddition"/>
                           </td>
                        </tr>
                     </tbody>
                  </table>
                  <br/>
               </xsl:if>
               <span class="header">Транспортное средство</span>
               <br/>
               <xsl:apply-templates select="rstvha:TransportMean"/>
               <br/>
               <span class="header">Одобрение типа ТС</span>
               <br/>
               <xsl:apply-templates select="rstvha:Approval"/>
               <span class="header">Срок действия ОТТС с </span><xsl:value-of select="rstvha:TCvalidityBegin"/><span class="header"> по </span><xsl:value-of select="rstvha:TCvalidityEnd"/>
               <br/>
               <br/>
               <span class="header">Наименование, регистрационный номер и местонахождение органа по сертификации, выдавшего документ:</span>
               <br/>
               <xsl:value-of select="rstvha:TCcertifier"/>
               <br/>
               <br/>
               <span class="header">Заявитель и его адрес:</span>
               <br/>
               <xsl:value-of select="rstvha:Applicant"/>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="rstvha:TransportMean">
      <table>
         <tbody>
			 
            <xsl:if test="rstvha:EcoClass">
               <tr>
                  <td>Экологический класс ТС </td>
                  <td>
                     <xsl:value-of select="rstvha:EcoClass"/>
                  </td>
               </tr>
            </xsl:if>
            <xsl:if test="rstvha:Tcbrand">
               <tr>
                  <td>Марка транспортного средства </td>
                  <td>
                     <xsl:value-of select="rstvha:Tcbrand"/>
                  </td>
               </tr>
            </xsl:if>
            <xsl:if test="rstvha:TCtradeName">
               <tr>
                  <td>Коммерческое наименование ТС </td>
                  <td>
                     <xsl:value-of select="rstvha:TCtradeName"/>
                  </td>
               </tr>
            </xsl:if>
            <xsl:if test="rstvha:Tctype">
               <tr>
                  <td>Тип транспортного средства </td>
                  <td>
                     <xsl:value-of select="rstvha:Tctype"/>
                  </td>
               </tr>
            </xsl:if>
            <xsl:if test="rstvha:Tcchassis">
               <tr>
                  <td>Шасси ТС </td>
                  <td>
                     <xsl:value-of select="rstvha:Tcchassis"/>
                  </td>
               </tr>
            </xsl:if>
            <xsl:if test="rstvha:Tcmodifications">
               <tr>
                  <td>Модификации </td>
                  <td>
                     <xsl:value-of select="rstvha:Tcmodifications"/>
                  </td>
               </tr>
            </xsl:if>
            <xsl:if test="rstvha:Tccategory">
               <tr>
                  <td>Категория </td>
                  <td>
                     <xsl:value-of select="rstvha:Tccategory"/>
                  </td>
               </tr>
            </xsl:if>
            <xsl:if test="rstvha:OkpTnved">
               <tr>
                  <td>Код ОКП/ТН ВЭД </td>
                  <td>
                     <xsl:value-of select="rstvha:OkpTnved"/>
                  </td>
               </tr>
            </xsl:if>
            <xsl:if test="rstvha:Manufacturer">
               <tr>
                  <td>Изготовитель и его адрес </td>
                  <td>
                     <xsl:value-of select="rstvha:Manufacturer"/>
                  </td>
               </tr>
            </xsl:if>
            <xsl:if test="rstvha:ManufacturerAgent">
               <tr>
                  <td>Представитель изготовителя и его адрес </td>
                  <td>
                     <xsl:value-of select="rstvha:ManufacturerAgent"/>
                  </td>
               </tr>
            </xsl:if>
            <xsl:if test="rstvha:AssemblyPlant">
               <tr>
                  <td>Сборочные заводы и их адреса </td>
                  <td>
                     <xsl:value-of select="rstvha:AssemblyPlant"/>
                  </td>
               </tr>
            </xsl:if>
            <xsl:if test="rstvha:Supplier">
               <tr>
                  <td>Поставщик сборочных комплектов и его адрес </td>
                  <td>
                     <xsl:value-of select="rstvha:Supplier"/>
                  </td>
               </tr>
            </xsl:if>
            <xsl:if test="rstvha:TC_ID">
               <tr>
                  <td>Идентификационный номер </td>
                  <td>
                     <xsl:value-of select="rstvha:TC_ID"/>
                  </td>
               </tr>
            </xsl:if>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template match="rstvha:Approval">
      <span>
         <xsl:value-of select="cat_ru:PrDocumentName"/>
         <xsl:if test="cat_ru:PrDocumentNumber">
			№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
         </xsl:if>
         <br/>
         <xsl:if test="cat_ru:PrDocumentDate">
			создан(о) 
			<xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
            </xsl:call-template>
         </xsl:if>
      </span>
      <br/>
   </xsl:template>
</xsl:stylesheet>
