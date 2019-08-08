<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:SInWs="urn:SumInWords:5.12.1">
	<xsl:variable name="Self" select='document("")'/>

	<xsl:template name="RecurseSumWords">
		<xsl:param name="Value"/>
		<xsl:param name="Fraction"/>
		<xsl:param name="IsFraction"/>
		<xsl:variable name="temp">
			<xsl:call-template name="RecurseSumWords_RealRecurse">
				<xsl:with-param name="Value" select="$Value"/>
				<xsl:with-param name="Fraction" select="$Fraction"/>
				<xsl:with-param name="IsFraction" select="$IsFraction"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="lower">
			абвгдеёжзийклмнопрстуфхцчшщэюя
		</xsl:variable>
		 <xsl:variable name="upper">
			АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЭЮЯ
		 </xsl:variable>
		<xsl:value-of select="concat(translate(substring($temp,1,1),$lower,$upper), substring($temp,2))"/>
	</xsl:template>

	<xsl:template name="RecurseSumWords_RealRecurse">
		<xsl:param name="Value" select="''"/>
		<xsl:param name="Fraction" select="0"/> <!-- определяет род числительного 0-мужской, 1-женский-->
		<xsl:param name="IsFraction" select="0"/><!-- какая часть числа переводится в словесную форму. 0 - целая, 1 - дробная -->

		<xsl:variable name="ValueInteger">
			<xsl:choose>
				<xsl:when test="contains($Value,'.')"><xsl:value-of select="substring-before($Value,'.')"/></xsl:when>
				<xsl:otherwise><xsl:value-of select="$Value"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="ValueFraction">
			<xsl:choose>
				<xsl:when test="contains($Value,'.')"><xsl:value-of select="substring-after($Value,'.')"/></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:choose>
			<xsl:when test="($ValueInteger div 1000000000000) - (($ValueInteger mod 1000000000000) div 1000000000000) > 0">
				<xsl:variable name="v1" select="$ValueInteger div 1000000000000"/>
				<xsl:variable name="v" select="floor($v1)*($v1 >= 0) + ceiling($v1) * not($v1 >= 0)"/>
				<xsl:call-template name="DecodeInteger">
					<xsl:with-param name="Value" select="$v"/>
					<xsl:with-param name="controlbad" select="0"/>
				</xsl:call-template>
				<xsl:call-template name="GetWordType">
					<xsl:with-param name="Value" select="$v"/>
					<xsl:with-param name="tagName" select="'SInWs:Trillion'"/>
				</xsl:call-template>
				<xsl:if test="$ValueInteger mod 1000000000000!=0">
					<xsl:call-template name="RecurseSumWords_RealRecurse">
						<xsl:with-param name="Value" select="$ValueInteger mod 1000000000000"/>
						<xsl:with-param name="IsFraction" select="$IsFraction"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:when>
			<xsl:when test="($ValueInteger div 1000000000) - (($ValueInteger mod 1000000000) div 1000000000) > 0">
				<xsl:variable name="v1" select="$ValueInteger div 1000000000"/>
				<xsl:variable name="v" select="floor($v1)*($v1 >= 0) + ceiling($v1) * not($v1 >= 0)"/>
				<xsl:call-template name="DecodeInteger">
					<xsl:with-param name="Value" select="$v"/>
					<xsl:with-param name="controlbad" select="0"/>
				</xsl:call-template>
				<xsl:call-template name="GetWordType">
					<xsl:with-param name="Value" select="$v"/>
					<xsl:with-param name="tagName" select="'SInWs:Billion'"/>
				</xsl:call-template>
				<xsl:if test="$ValueInteger mod 1000000000!=0">
					<xsl:call-template name="RecurseSumWords_RealRecurse">
						<xsl:with-param name="Value" select="$ValueInteger mod 1000000000"/>
						<xsl:with-param name="IsFraction" select="$IsFraction"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:when>
			<xsl:when test="($ValueInteger div 1000000) - (($ValueInteger mod 1000000) div 1000000) > 0">
				<xsl:variable name="v1" select="$ValueInteger div 1000000"/>
				<xsl:variable name="v" select="floor($v1)*($v1 >= 0) + ceiling($v1) * not($v1 >= 0)"/>
				<xsl:call-template name="DecodeInteger">
					<xsl:with-param name="Value" select="$v"/>
					<xsl:with-param name="controlbad" select="0"/>
				</xsl:call-template>
				<xsl:call-template name="GetWordType">
					<xsl:with-param name="Value" select="$v"/>
					<xsl:with-param name="tagName" select="'SInWs:Million'"/>
				</xsl:call-template>
				<xsl:if test="$ValueInteger mod 1000000!=0">
					<xsl:call-template name="RecurseSumWords_RealRecurse">
						<xsl:with-param name="Value" select="$ValueInteger mod 1000000"/>
						<xsl:with-param name="IsFraction" select="$IsFraction"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:when>
			<xsl:when test="($ValueInteger div 1000) - (($ValueInteger mod 1000) div 1000) > 0">
				<xsl:variable name="v1" select="$ValueInteger div 1000"/>
				<xsl:variable name="v" select="floor($v1)*($v1 >= 0) + ceiling($v1) * not($v1 >= 0)"/>
				<xsl:call-template name="DecodeInteger">
					<xsl:with-param name="Value" select="$v"/>
					<xsl:with-param name="controlbad" select="1"/>
				</xsl:call-template>
				<xsl:call-template name="GetWordType">
					<xsl:with-param name="Value" select="$v"/>
					<xsl:with-param name="tagName" select="'SInWs:Thousand'"/>
				</xsl:call-template>
				<xsl:if test="$ValueInteger mod 1000!=0">
					<xsl:call-template name="RecurseSumWords_RealRecurse">
						<xsl:with-param name="Value" select="$ValueInteger mod 1000"/>
						<xsl:with-param name="IsFraction" select="$IsFraction"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$ValueInteger != 0 and ($IsFraction = '0' or $IsFraction = '')">
				<xsl:if test="contains($Value,'.')">
					<xsl:call-template name="DecodeInteger">
						<xsl:with-param name="Value" select="$ValueInteger"/>
						<xsl:with-param name="controlbad" select="1"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="not(contains($Value,'.'))">
					<xsl:call-template name="DecodeInteger">
						<xsl:with-param name="Value" select="$ValueInteger"/>
						<xsl:with-param name="controlbad" select="$Fraction"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$ValueInteger != 0 and $IsFraction = '1'">
				<xsl:call-template name="DecodeInteger">
					<xsl:with-param name="Value" select="$ValueInteger"/>
					<xsl:with-param name="controlbad" select="1"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$ValueInteger = 0 or $ValueInteger=''">ноль</xsl:when>
		</xsl:choose>
		
		<!--<xsl:if test="$Fraction='1' and contains($Value,'.')">-->
		<xsl:if test="$ValueFraction != '' and contains($Value,'.')">
			<xsl:choose>
				<xsl:when test="substring($ValueInteger,string-length($ValueInteger) - 1) != '11' and substring($ValueInteger,string-length($ValueInteger)) = '1'"> целая </xsl:when>
				<xsl:otherwise> целых </xsl:otherwise>
			</xsl:choose>
			<xsl:call-template name="RecurseSumWords_RealRecurse">
				<xsl:with-param name="Value" select="$ValueFraction"/>
				<xsl:with-param name="IsFraction" select="1"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
			<xsl:choose>
				<xsl:when test="string-length($ValueFraction)=1">десят</xsl:when>
				<xsl:when test="string-length($ValueFraction)=2">сот</xsl:when>
				<xsl:when test="string-length($ValueFraction)=3">тысячн</xsl:when>
				<xsl:when test="string-length($ValueFraction)=4">десятитысячн</xsl:when>
				<xsl:when test="string-length($ValueFraction)=5">статысячн</xsl:when>
				<xsl:when test="string-length($ValueFraction)=6">миллионн</xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="substring($ValueFraction,string-length($ValueFraction) - 1) != '11' and substring($ValueFraction, string-length($ValueFraction - 1), 1)='1'">ая</xsl:when>
				<xsl:otherwise>ых</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		
	</xsl:template>
	<xsl:template name="DecodeInteger">
		<xsl:param name="Value" select="''"/>
		<xsl:param name="controlbad" select="''"/>
		<xsl:variable name="Value100" select="$Value mod 100"/>
		<xsl:if test="($Value div 100) - ($Value100 div 100) != 0">
			<xsl:call-template name="GetWordData">
				<xsl:with-param name="Pos" select="27 + (($Value div 100) - ($Value100 div 100))"/>
				<xsl:with-param name="tagName" select="'SInWs:Words'"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="$Value100 > 20">
				<xsl:call-template name="GetWordData">
					<xsl:with-param name="Pos" select="18 + (($Value100 div 10) - (($Value100 mod 10) div 10))"/>
					<xsl:with-param name="tagName" select="'SInWs:Words'"/>
				</xsl:call-template>
				<xsl:if test="$Value100 mod 10 != 0">
					<xsl:call-template name="GetSmallWord">
						<xsl:with-param name="Value" select="$Value100 mod 10"/>
						<xsl:with-param name="controlbad" select="$controlbad"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$Value100 != 0">
				<xsl:call-template name="GetSmallWord">
					<xsl:with-param name="Value" select="$Value100"/>
					<xsl:with-param name="controlbad" select="$controlbad"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="GetSmallWord">
		<xsl:param name="Value" select="''"/>
		<xsl:param name="controlbad" select="''"/>
		<xsl:choose>
			<xsl:when test="($controlbad = 1) and ($Value &lt; 3)">
				<xsl:call-template name="GetWordData">
					<xsl:with-param name="Pos" select="$Value"/>
					<xsl:with-param name="tagName" select="'SInWs:BadWord'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="GetWordData">
					<xsl:with-param name="Pos" select="$Value"/>
					<xsl:with-param name="tagName" select="'SInWs:Words'"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="GetWordType">
		<xsl:param name="Value" select="''"/>
		<xsl:param name="tagName" select="''"/>
		<xsl:choose>
			<xsl:when test="($Value mod 100) > 20">
				<xsl:call-template name="GetInnerType">
					<xsl:with-param name="Value" select="($Value mod 100) mod 10"/>
					<xsl:with-param name="tagName" select="$tagName"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="GetInnerType">
					<xsl:with-param name="Value" select="$Value mod 100"/>
					<xsl:with-param name="tagName" select="$tagName"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="GetInnerType">
		<xsl:param name="Value" select="''"/>
		<xsl:param name="tagName" select="''"/>
		<xsl:choose>
			<xsl:when test="$Value = 1">
				<xsl:call-template name="GetWordData">
					<xsl:with-param name="Pos" select="1"/>
					<xsl:with-param name="tagName" select="$tagName"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$Value > 1 and $Value &lt; 5">
				<xsl:call-template name="GetWordData">
					<xsl:with-param name="Pos" select="2"/>
					<xsl:with-param name="tagName" select="$tagName"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="GetWordData">
					<xsl:with-param name="Pos" select="3"/>
					<xsl:with-param name="tagName" select="$tagName"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="GetWordData">
		<xsl:param name="Pos" select="''"/>
		<xsl:param name="tagName" select="''"/>
		<xsl:for-each select="$Self//SInWs:*[name() = $tagName]">
			<xsl:if test="position() = $Pos">
				<xsl:value-of select="./@word"/>
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<SInWs:Trillion word="триллион"/>
	<SInWs:Trillion word="триллиона"/>
	<SInWs:Trillion word="триллионов"/>
	<SInWs:Billion word="миллиард"/>
	<SInWs:Billion word="миллиарда"/>
	<SInWs:Billion word="миллиардов"/>
	<SInWs:Million word="миллион"/>
	<SInWs:Million word="миллиона"/>
	<SInWs:Million word="миллионов"/>
	<SInWs:Thousand word="тысяча"/>
	<SInWs:Thousand word="тысячи"/>
	<SInWs:Thousand word="тысяч"/>
	<SInWs:BadWord word="одна"/>
	<SInWs:BadWord word="две"/>
	<SInWs:Words word="один"/>
	<SInWs:Words word="два"/>
	<SInWs:Words word="три"/>
	<SInWs:Words word="четыре"/>
	<SInWs:Words word="пять"/>
	<SInWs:Words word="шесть"/>
	<SInWs:Words word="семь"/>
	<SInWs:Words word="восемь"/>
	<SInWs:Words word="девять"/>
	<SInWs:Words word="десять"/>
	<SInWs:Words word="одиннадцать"/>
	<SInWs:Words word="двенадцать"/>
	<SInWs:Words word="тринадцать"/>
	<SInWs:Words word="четырнадцать"/>
	<SInWs:Words word="пятнадцать"/>
	<SInWs:Words word="шестнадцать"/>
	<SInWs:Words word="семнадцать"/>
	<SInWs:Words word="восемнадцать"/>
	<SInWs:Words word="девятнадцать"/>
	<SInWs:Words word="двадцать"/>
	<SInWs:Words word="тридцать"/>
	<SInWs:Words word="сорок"/>
	<SInWs:Words word="пятьдесят"/>
	<SInWs:Words word="шестьдесят"/>
	<SInWs:Words word="семьдесят"/>
	<SInWs:Words word="восемьдесят"/>
	<SInWs:Words word="девяносто"/>
	<SInWs:Words word="сто"/>
	<SInWs:Words word="двести"/>
	<SInWs:Words word="триста"/>
	<SInWs:Words word="четыреста"/>
	<SInWs:Words word="пятьсот"/>
	<SInWs:Words word="шестьсот"/>
	<SInWs:Words word="семьсот"/>
	<SInWs:Words word="восемьсот"/>
	<SInWs:Words word="девятьсот"/>
</xsl:stylesheet>
