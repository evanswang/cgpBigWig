########## LICENSE ##########
# Copyright (c) 2016 Genome Research Ltd.
#
# Author: Cancer Genome Project cgpit@sanger.ac.uk
#
# This file is part of cgpBigWig.
#
# cgpBigWig is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation; either version 3 of the License, or (at your option) any
# later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
#    1. The usage of a range of years within a copyright statement contained within
#    this distribution should be interpreted as being equivalent to a list of years
#    including the first and last year specified and all consecutive years between
#    them. For example, a copyright statement that reads ‘Copyright (c) 2005, 2007-
#    2009, 2011-2012’ should be interpreted as being identical to a statement that
#    reads ‘Copyright (c) 2005, 2007, 2008, 2009, 2011, 2012’ and a copyright
#    statement that reads ‘Copyright (c) 2005-2012’ should be interpreted as being
#    identical to a statement that reads ‘Copyright (c) 2005, 2006, 2007, 2008,
#    2009, 2010, 2011, 2012’."
#
###########################

echo "Running unit tests:"

for i in c_tests/*_tests
do
	if test -f $i
	then
		if $VALGRIND ./$i 2>> c_tests/tests_log
		then
			echo $i PASS
		else
			echo "ERROR in test $i: here's tests/tests_log"
			echo "------"
			tail c_tests/tests_log
			exit 1
		fi
	fi
done

echo "Running script tests:"

for j in c_tests/test_*.sh
do
  if ./$j 2>> c_tests/tests_log
   then echo $j PASS
  else
    echo "ERROR in "$j": here's c_tests/tests_log"
    echo "------"
    tail c_tests/tests_log
    exit 1
  fi
done
echo ""
