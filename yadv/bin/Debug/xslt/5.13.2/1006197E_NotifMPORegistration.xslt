<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:nmpo="urn:customs.ru:Information:CustomsDocuments:NotifMPORegistration:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="nmpo:NotifMPORegistration">
      <html>
         <head>
            <title>Уведомление о регистрации МПО</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
			body {
					background: #ffffff;
				}

				div.page {
					width: 210mm;
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
					font-weight: bold;
					margin-top:20px;
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
					font-fase: Courier;
				}
				.graph {
							font-family: Arial;
							font-size: 8pt;
							}
				jh {
				font: 16;
				font-face: Arial;
				}
				dog1 {
	            position:relative;
	            left: 50px;
	            bottom: 50px;
	            }
	            .gra {
							font-family: Arial;
							font-size: 6pt;
							}
				.g{
							font-family: Times new roman;
							}
				</style>
         </head>
         <body>
            <div class="page">
               <table>
                  <tr>
                     <td align="center" style="border:solid 0pt">
                        <font face="Times new roman" size="4">
                           <b>Уведомление о регистрации МПО</b>
                        </font>
                     </td>
                  </tr>
               </table>
               <table>
                  <tr>
                     <td style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="g" style="border:solid 0pt">Дата регистрации 
						<xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="nmpo:RegistrationDate"/>
                        </xsl:call-template>
                     </td>
                  </tr>
                  <tr>
                     <td class="g" style="border:solid 0pt">Время
						<xsl:value-of select="substring(nmpo:RegistrationTime, 1, 8)"/>
                     </td>
                  </tr>
                  <tr>
                     <td style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="g" style="border:solid 0pt">Регистрационный номер МПО:
						<xsl:apply-templates select="nmpo:MPO_Registration"/>
                     </td>
                  </tr>
                  <tr>
                     <td class="g" style="border:solid 0pt">Таможенный орган: 
						<xsl:value-of select="nmpo:Customs/cat_ru:Code"/>
                        <xsl:if test="nmpo:Customs/cat_ru:OfficeName"> <xsl:value-of select="nmpo:Customs/cat_ru:OfficeName"/>
                        </xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td class="g" style="border:solid 0pt">Должностное лицо:
						<xsl:value-of select="nmpo:CustomsPerson/cat_ru:PersonSurname"/> 
						<xsl:value-of select="nmpo:CustomsPerson/cat_ru:PersonName"/>
                        <xsl:if test="nmpo:CustomsPerson/cat_ru:PersonMiddleName"> <xsl:value-of select="nmpo:CustomsPerson/cat_ru:PersonMiddleName"/>
                        </xsl:if>
                        <xsl:if test="nmpo:CustomsPerson/cat_ru:PersonPost"> (<xsl:value-of select="nmpo:CustomsPerson/cat_ru:PersonPost"/>)</xsl:if>
                     </td>
                  </tr>
                  <xsl:if test="nmpo:CustomsPerson/cat_ru:IssueDate">
                     <tr>
                        <td class="g" style="border:solid 0pt">
						Дата подписания 
						<xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="nmpo:CustomsPerson/cat_ru:IssueDate"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                  </xsl:if>
                  <tr>
                     <td style="border:solid 0pt"> </td>
                  </tr>
                  <xsl:if test="nmpo:Comments">
                     <tr>
                        <td class="g" style="border:solid 0pt">
                           <u>Комментарии:</u> 
						<xsl:value-of select="nmpo:Comments"/>
                        </td>
                     </tr>
                  </xsl:if>
               </table>
            </div>
         </body>
      </html>
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
   <xsl:template match="nmpo:MPO_Registration">
      <xsl:if test="nmpo:CustomsCode">
         <xsl:value-of select="nmpo:CustomsCode"/>/</xsl:if>
      <xsl:if test="nmpo:RegistrationDate">
         <xsl:value-of select="substring(nmpo:RegistrationDate,9,2)"/>
         <xsl:value-of select="substring(nmpo:RegistrationDate,6,2)"/>
         <xsl:value-of select="substring(nmpo:RegistrationDate,3,2)"/>/</xsl:if>
      <xsl:value-of select="nmpo:MPO_Number"/>
   </xsl:template>
</xsl:stylesheet>
