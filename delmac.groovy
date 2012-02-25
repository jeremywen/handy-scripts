new File(".").eachDirRecurse{dir->
	if("__MACOSX".equals(dir.name)){
		println "deleting $dir"
		dir.canonicalFile.deleteDir()
	} else {
		dir.eachFileRecurse{file->
			if(".DS_Store".equals(file.name)){
				println "deleting $file"
				file.canonicalFile.delete()
			}
		}
	}
}