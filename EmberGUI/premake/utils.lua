function trymkdir(aDir)

    if not (os.isdir(aDir)) then
        print("Couldnt find dir " .. os.realpath(aDir) .. ". Creating.")
        os.mkdir(os.realpath(aDir))
    end
end

function setDebugDir(aDir)
    print("Assigning debug directory! [" .. os.realpath(aDir) .. "]")
    trymkdir(os.realpath(aDir))
    debugdir(os.realpath(aDir))
    --print("Debug directory assigned as [" .. debugdir .. "]")
end

function setObjDir(aDir)
    print("Assigning intermediate directory! [" .. os.realpath(aDir) .. "]")
    trymkdir(os.realpath(aDir))
    objdir(os.realpath(aDir))
    --print("Intermediate directory assigned as [" .. objdir .. "]")
end

function setTargetDir(aDir)
    print("Assigning output directory! [" .. os.realpath(aDir) .. "]")
    trymkdir(os.realpath(aDir))
    targetdir(os.realpath(aDir))
    --print("Output directory assigned as [" .. targetdir .. "]")
end

