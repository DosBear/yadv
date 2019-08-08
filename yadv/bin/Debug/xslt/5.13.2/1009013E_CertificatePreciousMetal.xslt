<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru cepm" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cepm="urn:customs.ru:Information:SertifDocuments:CertificatePreciousMetal:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
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
   <xsl:template name="Date_2">
      <xsl:value-of select="substring (., 9, 2)"/>.
					<xsl:value-of select="substring(., 6, 2)"/>.
					<xsl:value-of select="substring(., 1, 4)"/>
   </xsl:template>
   <xsl:template name="Address">
      <xsl:if test="cat_ru:PostalCode">
         <xsl:value-of select="cat_ru:PostalCode"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:value-of select="cat_ru:Region"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:value-of select="cat_ru:City"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="cepm:CertificatePreciousMetal">
      <html>
         <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
         <style type="text/css">
                    body {}
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

                    @media print {
                        div.page {
                            border: none;
                            padding: 0;
                        }
                    }
                     .graph12 {
                        font-family: Arial, serif, bold;
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
                     .underlined {
                        border-bottom: solid 1pt #000000;
                    }
                    </style>
         <table style="width:170mm">
            <tr>
               <td align="center" class="graph12" colspan="2">
                  <br>СЕРТИФИКАТ</br>
                  <br>ХИМИЧЕСКОГО СОСТАВА НА СОДЕРЖАНИЕ ДРАГМЕТАЛЛОВ</br>
               </td>
            </tr>
            <tr>
               <td/>
            </tr>
            <tr>
               <td align="right" class="graph10" colspan="2">Зарегистрирован</td>
            </tr>
            <tr>
               <td align="right" class="graph10" colspan="2">в реестре Роскомдрагмета</td>
            </tr>
            <tr>
               <td align="right" class="graph10" colspan="2">
                  <xsl:for-each select="cepm:IssueDate">
                     <xsl:call-template name="Date"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="right" class="graph10" colspan="2">№ 
						<xsl:value-of select="cepm:RegistrationNumber"/>
               </td>
            </tr>
            <tr>
               <td align="right" class="graph10" colspan="2">Действителен до 
						<xsl:for-each select="cepm:ExpirationDate">
                     <xsl:call-template name="Date"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td/>
            </tr>
            <tr>
               <td class="graph10" colspan="2">Выдан заявителю (предприятию) 
						<xsl:value-of select="cepm:DeclarantInfo/cat_ru:OrganizationName"/>, 
						<xsl:for-each select="cepm:DeclarantInfo/cat_ru:Address">
                     <xsl:call-template name="Address"/>
                  </xsl:for-each>,  						 
						<xsl:value-of select="cepm:DeclarantInfo/cat_ru:OKPOID"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="2">(наименование организации - заявителя (предприятия - поставщика), адрес, код ОКПО)</td>
            </tr>
            <tr>
               <td class="graph10" colspan="2">Настоящий сертификат    удостоверяет,    что   идентифицированный надлежащим образом образец (проба) продукции 
						<xsl:for-each select="cepm:GoodsInfo">
                     <xsl:for-each select="cepm:GoodsName">
                        <xsl:value-of select="."/> 
						</xsl:for-each>,  
						<xsl:value-of select="cepm:GoodsKind"/>,  
						<xsl:value-of select="cepm:GoodsMark"/>,  
						<xsl:value-of select="cepm:GoodsTNVEDCode"/>,  
						<xsl:value-of select="cepm:GoodsOKP"/>
                  </xsl:for-each>; 
						</td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="2">(наименование продукции, вид, марка, коды ТН ВЭД и ОКП</td>
            </tr>
            <tr>
               <td class="graph10" colspan="2">испытан в соответствии с требованиями, установленными в 
						<xsl:for-each select="cepm:ExperimentAccordanceDocuments">
                     <xsl:value-of select="cat_ru:PrDocumentName"/>, 
						</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="2">(обозначение стандартов или иных нормативных документов, в т.ч. аттестованных методик)</td>
            </tr>
            <tr>
               <td class="graph10" colspan="2">Испытания (анализ)  образцов  (проб),  проведенных  испытательной лабораторией (центром) 
						<xsl:if test="cepm:Laboratory">
                     <xsl:value-of select="cepm:Laboratory/cepm:NameLaboratory"/>
                     <xsl:value-of select="cepm:Laboratory/cepm:RegistrationNumberAIL"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="2">(наименование испытательной лаборатории (центра), регистрационный номер АИЛ в Госреестре)</td>
            </tr>
            <tr>
               <td class="graph10" colspan="2">протокол испытаний 
						<xsl:for-each select="cepm:TestReport">№ 
						<xsl:value-of select="cat_ru:PrDocumentNumber"/> 
						<xsl:for-each select="cat_ru:PrDocumentDate">от 
						<xsl:call-template name="Date_2"/> 
						</xsl:for-each>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="2">(номер, дата утверждения)</td>
            </tr>
            <tr>
               <td class="graph10" colspan="2">показали, что содержание драгметаллов 
						<xsl:value-of select="cepm:NamePreciousMetal"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="2">(наименование драгметаллов)</td>
            </tr>
            <tr>
               <td class="graph10" colspan="2">составляет 
						<xsl:value-of select="cepm:ContentPercent"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="2">(% содержание и в пересчете грамм / тонна)</td>
            </tr>
            <tr>
               <td class="graph10" colspan="2">Сертификат выдан  
						<xsl:value-of select="cepm:IssueOrganization/cat_ru:OrganizationName"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:for-each select="cepm:IssueOrganization//cat_ru:Address">
                     <xsl:call-template name="Address"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="2">(наименование, организации, выдавшей сертификат химического состава на содержание драгметаллов, адрес)</td>
            </tr>
            <tr>
               <td class="graph10">Руководитель организации,</td>
            </tr>
            <tr>
               <td class="graph10">выдавшей сертификат</td>
            </tr>
            <tr>
               <td align="center" class="graph10">______________________________</td>
               <td align="center" class="graph10">
                  <xsl:value-of select="cepm:IssuePersonSignature/cat_ru:PersonSurname"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="cepm:IssuePersonSignature/cat_ru:PersonName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="cepm:IssuePersonSignature/cat_ru:PersonMiddleName"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(подпись)</td>
               <td align="center" class="graph8">(инициалы, фамилия)</td>
            </tr>
            <tr>
               <td class="graph8">М.П.</td>
            </tr>
            <tr>
               <td/>
            </tr>
            <tr>
               <td/>
            </tr>
            <tr>
               <td align="center" class="graph10">Дата</td>
               <td align="center" class="graph10">
                  <xsl:for-each select="cepm:IssuePersonSignature/cat_ru:IssueDate">
                     <xsl:call-template name="Date_2"/>
                  </xsl:for-each>
               </td>
            </tr>
         </table>
      </html>
   </xsl:template>
</xsl:stylesheet>
