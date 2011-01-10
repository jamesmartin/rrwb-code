class Report
  def Report.report(out, machines, robot)
    write_factory_report_header_to(out)
    write_machine_report_to(out, machines)
    write_robot_location_to(out, robot)
    write_report_footer_to(out)
  end

  def Report.write_factory_report_header_to(out)
    out.print "FACTORY REPORT\n"
  end

  def Report.write_machine_report_to(out, machines)
    machines.each do |machine|
      out.print "Machine #{machine.name}"
      out.print " bin=#{machine.bin}" if machine.bin != nil
      out.print "\n"
    end
    write_line_break_to(out)
  end

  def Report.write_line_break_to(out)
    out.print "\n"
  end
  
  def Report.write_robot_location_to(out, robot)
    out.print "Robot"
    if robot.location != nil
      out.print " location=#{robot.location.name}"
    end
    out.print " bin=#{robot.bin}" if robot.bin != nil
    write_line_break_to(out)
  end

  def Report.write_report_footer_to(out)
    out.print "========\n"
  end
end
