jenkins_script 'build-pipeline-plugin' do
command <<-EOH.gsub(/^ {4}/, '')

import hudson.model.*
import hudson.views.*
import au.com.centrumsystems.hudson.plugin.buildpipeline.*

restrict_trigger_to_recent = false
final String project = "project";
    final DownstreamProjectGridBuilder gridBuilder = new DownstreamProjectGridBuilder(project);
v = new BuildPipelineView("Build Dashboard", "Rapidline", gridBuilder, "1", restrict_trigger_to_recent, true, false, false, true, 3, null, "New Window")
Hudson.instance.addView(v)

EOH

end