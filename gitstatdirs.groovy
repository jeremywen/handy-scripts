println """
  ______ _____ _______      _______ _______ _______ _______
 |  ____   |      |         |______    |    |_____|    |   
 |_____| __|__    |         ______|    |    |     |    |   
                                                           
 ______  _____  ______ _______
 |     \\   |   |_____/ |______
 |_____/ __|__ |    \\_ ______|
                              
"""
new File(".").eachDir {
	if(new File(it,".git").exists()){
		println "#" * 100
		println it.canonicalPath
		def proc = "git status".execute(null,it)
		proc.waitFor()  
		println "${proc.err.text}"
		println "${proc.in.text}"
	}
}
