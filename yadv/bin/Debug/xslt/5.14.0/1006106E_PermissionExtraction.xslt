<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru pex" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:pex="urn:customs.ru:Information:CustomsDocuments:PermissionExtraction:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template name="Time">
      <xsl:value-of select="substring (., 1, 5)"/>.
	</xsl:template>
   <xsl:template name="Address">
      <xsl:if test="cat_ru:PostalCode">
         <xsl:value-of select="cat_ru:PostalCode"/> 
	</xsl:if>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/> 
	</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:value-of select="cat_ru:Region"/> 
	</xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:value-of select="cat_ru:City"/> 
	</xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="pex:PermissionExtraction">
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
                     table.items {border-collapse: collapse;}
                    table.items td, table.items th {border: 1px solid black; padding: 2px;font-family: Arial;                        font-size: 10pt;}
                    table.items th {background-color: WhiteSmoke;}
                    
                    </style>
         <table style="width:170mm">
            <tr>
               <td align="center" class="graph10" style="width:60mm">Федеральное агентство по рыболовству</td>
               <td align="center" class="graph10" style="width:50mm"> Государственный герб Российской Федерации</td>
               <td align="center" class="graph10" style="width:60mm">
                  <xsl:value-of select="pex:NameManagement"/>
				 территориальное управление</td>
            </tr>
            <tr>
               <td align="center" class="graph12" colspan="3">
                  <br>РАЗРЕШЕНИЕ</br>
                  <br>на добычу (вылов) водных биологических ресурсов</br>
                  <br>N 
				<xsl:value-of select="pex:RegNumber"/>
                  </br>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="3">Основание для выдачи разрешения: 
				<xsl:value-of select="pex:GroundsIssuing"/>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="3">Сведения  о  пользователе: 
				<xsl:value-of select="pex:UserInfo/cat_ru:OrganizationName"/> 
				<xsl:for-each select="pex:UserInfo/cat_ru:Address">
                     <xsl:call-template name="Address"/> 
				</xsl:for-each>
                  <xsl:if test="pex:UserInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN">
				ИНН <xsl:value-of select="pex:UserInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> 
				</xsl:if>
                  <xsl:if test="pex:UserInfo/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
				КПП <xsl:value-of select="pex:UserInfo/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> 
				</xsl:if>
                  <xsl:if test="pex:UserInfo/cat_ru:RBOrganizationFeatures/cat_ru:UNP">
				УНП <xsl:value-of select="pex:UserInfo/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/> 
				</xsl:if>
                  <xsl:if test="pex:UserInfo/cat_ru:RKOrganizationFeatures/cat_ru:BIN">
				BIN <xsl:value-of select="pex:UserInfo/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/> 
				</xsl:if>
                  <xsl:if test="pex:UserInfo/cat_ru:RKOrganizationFeatures/cat_ru:IIN">
				IIN <xsl:value-of select="pex:UserInfo/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/> 
				</xsl:if>
                  <xsl:if test="pex:UserInfo/cat_ru:RKOrganizationFeatures/cat_ru:ITN">
				 ITN 
				<xsl:if test="pex:UserInfo/cat_ru:RKOrganizationFeatures/cat_ru:ITN"/> 
				</xsl:if>
                  <xsl:if test="pex:UserInfo/cat_ru:OKATOCode">
				ОКАТО <xsl:value-of select="pex:UserInfo/cat_ru:OKATOCode"/> 
				</xsl:if>
                  <xsl:if test="pex:UserInfo/pex:IdentityCard">
                     <xsl:value-of select="pex:UserInfo/pex:IdentityCard/cat_ru:IdentityCardName"/> 
				<xsl:if test="pex:UserInfo/pex:IdentityCard/cat_ru:IdentityCardSeries">
				серия 
				<xsl:value-of select="pex:UserInfo/pex:IdentityCard/cat_ru:IdentityCardSeries"/> 
				</xsl:if>
				номер 
				<xsl:value-of select="pex:UserInfo/pex:IdentityCard/cat_ru:IdentityCardNumber"/> 
				выдан  
				<xsl:for-each select="pex:UserInfo/pex:IdentityCard/cat_ru:IdentityCardDate">
                        <xsl:call-template name="Date_2"/> 
				</xsl:for-each>
                     <xsl:if test="pex:UserInfo/pex:IdentityCard/cat_ru:OrganizationName">
                        <xsl:value-of select="pex:UserInfo/pex:IdentityCard/cat_ru:OrganizationName"/>
                     </xsl:if>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="3">Вид рыболовства:  
			<xsl:value-of select="pex:KindFishing"/>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="3">Условия  добычи  (вылова)  водных  биологических  ресурсов  (далее - водные биоресурсы): </td>
            </tr>
         </table>
         <table class="items" style="width:170mm">
            <tr>
               <td align="center">Район добычи (вылова) водных биоресурсов и (или) рыбопромысловый участок</td>
               <td align="center">Виды водных биоресурсов</td>
               <td align="center">Квоты (объемы) добычи (вылова) водных биоресурсов</td>
               <td align="center">Орудия, способы добычи (вылова) водных биоресурсов</td>
               <td align="center">Сроки добычи (вылова) водных биоресурсов </td>
            </tr>
            <xsl:for-each select="pex:ConditionsExtraction">
               <tr>
                  <td>
                     <xsl:value-of select="pex:MiningRegion"/>
                  </td>
                  <td>
                     <xsl:value-of select="pex:TypeResources"/>
                  </td>
                  <td>
                     <xsl:value-of select="pex:ProductionQuota"/>
                  </td>
                  <td>
                     <xsl:value-of select="pex:ProductionMethod"/>
                  </td>
                  <td>
                     <xsl:value-of select="pex:TermExtraction"/> 
				<xsl:value-of select="pex:MeasurementUnitTime"/>
                  </td>
               </tr>
            </xsl:for-each>
         </table>
         <table style="width:170mm">
            <tr>
               <td class="graph10">Ф.И.О.,  должность  лица, ответственного  за  добычу (вылов) водных биоресурсов: 
<xsl:value-of select="pex:PersonResponsibleProduction/cat_ru:PersonSurname"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="pex:PersonResponsibleProduction/cat_ru:PersonName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="pex:PersonResponsibleProduction/cat_ru:PersonMiddleName"/> 
<xsl:value-of select="pex:PersonResponsibleProduction/cat_ru:PersonPost"/>
               </td>
            </tr>
            <tr>
               <td class="graph10">Ф.И.О.,  должность  лица, ответственного  за  выполнение программы (плана) работ: 
<xsl:if test="pex:PersonResponsiblePerforming">
                     <xsl:value-of select="pex:PersonResponsiblePerforming/cat_ru:PersonSurname"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="pex:PersonResponsiblePerforming/cat_ru:PersonName"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="pex:PersonResponsiblePerforming/cat_ru:PersonMiddleName"/> 
<xsl:if test="pex:PersonResponsiblePerforming/cat_ru:PersonPost">
                        <xsl:value-of select="pex:PersonResponsiblePerforming/cat_ru:PersonPost"/>
                     </xsl:if>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td class="graph10">Обязательным  условием  является  соблюдение  при осуществлении организации любительского   и  спортивного  рыболовства  требований  в  области  охраны окружающей   среды,   правил   рыболовства   и  ограничений   рыболовства, установленных   законодательством  Российской  Федерации  и  международными договорами  Российской  Федерации в области рыболовства и сохранения водных биоресурсов для рыбохозяйственного бассейна.</td>
            </tr>
         </table>
         <table style="width:170mm">
            <tr>
               <td class="graph10">Дата выдачи</td>
               <td class="graph10">
                  <xsl:for-each select="pex:PersonSignature/cat_ru:IssueDate">
                     <xsl:call-template name="Date"/>
                  </xsl:for-each>
               </td>
               <td class="graph10">______________</td>
               <td class="graph10">
                  <xsl:value-of select="pex:PersonSignature/cat_ru:PersonPost"/> 
			<xsl:value-of select="pex:PersonSignature/cat_ru:PersonSurname"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="pex:PersonSignature/cat_ru:PersonName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="pex:PersonSignature/cat_ru:PersonMiddleName"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="2">М.П.</td>
               <td align="center" class="graph8">(подпись)</td>
               <td align="center" class="graph8">(должность, Ф.И.О.)</td>
            </tr>
         </table>
      </html>
   </xsl:template>
</xsl:stylesheet>
