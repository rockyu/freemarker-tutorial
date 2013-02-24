<html>
<head><title>Freemarker Self-Learning</title>

<body>
<div id="content">
    <h2>test map</h2>
    <#list map?keys as key>
        ${key} = ${map[key]}  <br />
    </#list>

    <h2>Test list (2)</h2>
    <#assign seq = ["winter", "spring", "summer", "autumn"]>
    <#list seq as x>
        ${x_index + 1}. ${x}<#if x_has_next>,</#if>
    </#list>

    <h2>If directive</h2>
    <#assign username = "rock.yu">
    <#if username == "rock.yu">
        Welcome Rock (${username})
    </#if>

    <h2>Ask whether a variable 'age' isn't missing</h2>
    <#if age??>
       agent: ${age}
    </#if>

    <h2>Specify a default if variable is missing or null</h2>
    agent: ${age!'Unknown age'}


    <h2> Built-ins for strings </h2>
    - ${'abc'?substring(1)}
    - ${'abc'?substring(1, 2)}


    <p>date, time, datetime </p>
    <#assign test1 = "10/25/1995"?date("MM/dd/yyyy")>
    <#assign test2 = "15:05:30"?time("HH:mm:ss")>
    <#assign test3 = "1995-10-25 03:05 PM"?datetime("yyyy-MM-dd hh:mm a")>
    ${test1}  <br />
    ${test2}  <br />
    ${test3}  <br />

    <p>ends_with</p>
    <#assign endwithhead = "redhead"?ends_with("head")>
    <#if endwithhead>true</#if>

    <p>ends_with</p>
    Length of 'Freemarker' is ${'Freemarker'?length}

    <p>lower_case</p>
    Lower_case  of 'Freemarker' is ${'Freemarker'?lower_case}

    <p>replace</p>
    ${"this is a car"?replace("car", "tomcat")}

    <p>url</p>
    <#setting url_escaping_charset='ISO-8859-1'>
    <#assign x = 'a/b c'>
    ${x?url}

    <h2>Date</h2>
    <#assign aDateTime = .now>
    <#assign aDate = aDateTime?date>
    <#assign aTime = aDateTime?time>

    <table>
        <tr>
            <td>Basic formats:</td>
            <td>${aDate?iso_utc}</td>
        </tr>
        <tr>
            <td></td>
            <td>${aTime?iso_utc}</td>
        </tr>
        <tr>
            <td></td>
            <td>${aDateTime?iso_utc}</td>
        </tr>
        <tr>
            <td>Different accuracies:</td>
            <td>${aTime?iso_utc_ms}</td>
        </tr>
        <tr>
            <td></td>
            <td>${aDateTime?iso_utc_m}</td>
        </tr>
        <tr>
            <td>Local time zone:</td>
            <td> ${aDateTime?iso_local}</td>
        </tr>
        <tr>
            <td>string.short:</td>
            <td>${aDateTime?string.short}</td>
        </tr>
    </table>

</div>
</body>
</html>