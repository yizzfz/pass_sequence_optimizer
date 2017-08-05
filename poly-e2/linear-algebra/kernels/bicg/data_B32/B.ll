; ModuleID = 'A.ll'
source_filename = "bicg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %0 = bitcast i8* %call to [1900 x double]*
  %arraydecay5 = bitcast i8* %call4 to double*
  %1 = bitcast i8* %call3 to double*
  tail call void @init_array(i32 1900, i32 2100, [1900 x double]* %0, double* %arraydecay5, double* %1)
  tail call void (...) @polybench_timer_start() #4
  %2 = bitcast i8* %call1 to double*
  %3 = bitcast i8* %call2 to double*
  %4 = bitcast i8* %call4 to double*
  tail call void @kernel_bicg(i32 1900, i32 2100, [1900 x double]* %0, double* %2, double* %3, double* %1, double* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %5 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %5, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %6 = bitcast i8* %call2 to double*
  %7 = bitcast i8* %call1 to double*
  tail call void @print_array(i32 1900, i32 2100, double* %7, double* %6)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  tail call void @free(i8* %call4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %m, i32 %n, [1900 x double]* %A, double* %r, double* %p) #2 {
entry:
  br i1 true, label %for.inc.preheader, label %for.cond2.preheader

for.inc.preheader:                                ; preds = %entry
  br i1 true, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.preheader
  %div.prol = fdiv double 0.000000e+00, 1.900000e+03
  store double %div.prol, double* %p, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.preheader, %for.inc.prol
  %inc13.unr = phi i32 [ 0, %for.inc.preheader ], [ 1, %for.inc.prol ]
  br i1 false, label %for.cond2.preheader, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.cond2.preheader.loopexit:                     ; preds = %for.inc
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.cond2.preheader.loopexit, %for.inc.prol.loopexit, %entry
  br i1 true, label %for.body5.lr.ph, label %for.end29

for.body5.lr.ph:                                  ; preds = %for.cond2.preheader
  br i1 true, label %for.body5.us.preheader, label %for.body5.preheader

for.body5.preheader:                              ; preds = %for.body5.lr.ph
  br i1 true, label %for.body5.prol.loopexit, label %for.body5.prol

for.body5.prol:                                   ; preds = %for.body5.preheader
  %div9.prol = fdiv double 0.000000e+00, 2.100000e+03
  store double %div9.prol, double* %r, align 8
  br label %for.body5.prol.loopexit

for.body5.prol.loopexit:                          ; preds = %for.body5.preheader, %for.body5.prol
  %.unr = phi i32 [ 0, %for.body5.preheader ], [ 1, %for.body5.prol ]
  br i1 false, label %for.end29, label %for.body5.preheader.new

for.body5.preheader.new:                          ; preds = %for.body5.prol.loopexit
  br label %for.body5

for.body5.us.preheader:                           ; preds = %for.body5.lr.ph
  br label %for.body5.us

for.body5.us:                                     ; preds = %for.cond12.for.inc27_crit_edge.us, %for.body5.us.preheader
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %for.cond12.for.inc27_crit_edge.us ], [ 0, %for.body5.us.preheader ]
  %storemerge16.us = phi i32 [ %6, %for.cond12.for.inc27_crit_edge.us ], [ 0, %for.body5.us.preheader ]
  %rem6.us = srem i32 %storemerge16.us, 2100
  %conv7.us = sitofp i32 %rem6.us to double
  %div9.us = fdiv double %conv7.us, 2.100000e+03
  %idxprom10.us = sext i32 %storemerge16.us to i64
  %arrayidx11.us = getelementptr inbounds double, double* %r, i64 %idxprom10.us
  store double %div9.us, double* %arrayidx11.us, align 8
  br i1 false, label %for.inc24.us.prol, label %for.inc24.us.prol.loopexit

for.inc24.us.prol:                                ; preds = %for.body5.us
  %0 = trunc i64 %indvars.iv17 to i32
  %rem16.us.prol = srem i32 %0, 2100
  %conv17.us.prol = sitofp i32 %rem16.us.prol to double
  %div19.us.prol = fdiv double %conv17.us.prol, 2.100000e+03
  %arrayidx23.us.prol = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv17, i64 0
  store double %div19.us.prol, double* %arrayidx23.us.prol, align 8
  br label %for.inc24.us.prol.loopexit

for.inc24.us.prol.loopexit:                       ; preds = %for.inc24.us.prol, %for.body5.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc24.us.prol ], [ 0, %for.body5.us ]
  br i1 false, label %for.cond12.for.inc27_crit_edge.us, label %for.body5.us.new

for.body5.us.new:                                 ; preds = %for.inc24.us.prol.loopexit
  br label %for.inc24.us

for.inc24.us:                                     ; preds = %for.inc24.us, %for.body5.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body5.us.new ], [ %indvars.iv.next.1, %for.inc24.us ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %1 = mul nsw i64 %indvars.iv17, %indvars.iv.next
  %2 = trunc i64 %1 to i32
  %rem16.us = srem i32 %2, 2100
  %conv17.us = sitofp i32 %rem16.us to double
  %arrayidx23.us = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv17, i64 %indvars.iv
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %3 = mul nsw i64 %indvars.iv17, %indvars.iv.next.1
  %4 = trunc i64 %3 to i32
  %rem16.us.1 = srem i32 %4, 2100
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.v.i0.1 = insertelement <2 x double> undef, double %conv17.us, i32 0
  %div19.us.v.i0.2 = insertelement <2 x double> %div19.us.v.i0.1, double %conv17.us.1, i32 1
  %div19.us = fdiv <2 x double> %div19.us.v.i0.2, <double 2.100000e+03, double 2.100000e+03>
  %5 = bitcast double* %arrayidx23.us to <2 x double>*
  store <2 x double> %div19.us, <2 x double>* %5, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1899
  br i1 %exitcond.1, label %for.cond12.for.inc27_crit_edge.us.loopexit, label %for.inc24.us

for.cond12.for.inc27_crit_edge.us.loopexit:       ; preds = %for.inc24.us
  br label %for.cond12.for.inc27_crit_edge.us

for.cond12.for.inc27_crit_edge.us:                ; preds = %for.cond12.for.inc27_crit_edge.us.loopexit, %for.inc24.us.prol.loopexit
  %indvars.iv.next18 = add i64 %indvars.iv17, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next18, 2100
  %6 = trunc i64 %indvars.iv.next18 to i32
  br i1 %cmp3.us, label %for.body5.us, label %for.end29.loopexit

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %inc13 = phi i32 [ %inc13.unr, %for.inc.preheader.new ], [ %inc.1, %for.inc ]
  %rem = srem i32 %inc13, 1900
  %conv = sitofp i32 %rem to double
  %idxprom = sext i32 %inc13 to i64
  %arrayidx = getelementptr inbounds double, double* %p, i64 %idxprom
  %inc = add nsw i32 %inc13, 1
  %rem.1 = srem i32 %inc, 1900
  %conv.1 = sitofp i32 %rem.1 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.900000e+03, double 1.900000e+03>
  %7 = bitcast double* %arrayidx to <2 x double>*
  store <2 x double> %div, <2 x double>* %7, align 8
  %inc.1 = add nsw i32 %inc13, 2
  %cmp.1 = icmp slt i32 %inc.1, 1900
  br i1 %cmp.1, label %for.inc, label %for.cond2.preheader.loopexit

for.body5:                                        ; preds = %for.body5, %for.body5.preheader.new
  %8 = phi i32 [ %.unr, %for.body5.preheader.new ], [ %inc28.1, %for.body5 ]
  %rem6 = srem i32 %8, 2100
  %conv7 = sitofp i32 %rem6 to double
  %idxprom10 = sext i32 %8 to i64
  %arrayidx11 = getelementptr inbounds double, double* %r, i64 %idxprom10
  %inc28 = add nsw i32 %8, 1
  %rem6.1 = srem i32 %inc28, 2100
  %conv7.1 = sitofp i32 %rem6.1 to double
  %div9.v.i0.1 = insertelement <2 x double> undef, double %conv7, i32 0
  %div9.v.i0.2 = insertelement <2 x double> %div9.v.i0.1, double %conv7.1, i32 1
  %div9 = fdiv <2 x double> %div9.v.i0.2, <double 2.100000e+03, double 2.100000e+03>
  %9 = bitcast double* %arrayidx11 to <2 x double>*
  store <2 x double> %div9, <2 x double>* %9, align 8
  %inc28.1 = add nsw i32 %8, 2
  %cmp3.1 = icmp slt i32 %inc28.1, 2100
  br i1 %cmp3.1, label %for.body5, label %for.end29.loopexit29

for.end29.loopexit:                               ; preds = %for.cond12.for.inc27_crit_edge.us
  br label %for.end29

for.end29.loopexit29:                             ; preds = %for.body5
  br label %for.end29

for.end29:                                        ; preds = %for.end29.loopexit29, %for.end29.loopexit, %for.body5.prol.loopexit, %for.cond2.preheader
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_bicg(i32 %m, i32 %n, [1900 x double]* %A, double* %s, double* %q, double* %p, double* %r) #2 {
entry:
  br i1 true, label %for.inc.lr.ph, label %for.cond1.preheader

for.inc.lr.ph:                                    ; preds = %entry
  br i1 false, label %for.inc.preheader, label %min.iters.checked

for.inc.preheader:                                ; preds = %middle.block, %min.iters.checked, %for.inc.lr.ph
  %inc15.ph = phi i32 [ 0, %min.iters.checked ], [ 0, %for.inc.lr.ph ], [ 1900, %middle.block ]
  br label %for.inc

min.iters.checked:                                ; preds = %for.inc.lr.ph
  br i1 false, label %for.inc.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br i1 false, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i32 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter65 = phi i32 [ %prol.iter65.sub, %vector.body.prol ], [ 3, %vector.body.prol.preheader ]
  %0 = sext i32 %index.prol to i64
  %1 = getelementptr inbounds double, double* %s, i64 %0
  %2 = bitcast double* %1 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %2, align 8
  %3 = getelementptr double, double* %1, i64 2
  %4 = bitcast double* %3 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %4, align 8
  %index.next.prol = add i32 %index.prol, 4
  %prol.iter65.sub = add i32 %prol.iter65, -1
  %prol.iter65.cmp = icmp eq i32 %prol.iter65.sub, 0
  br i1 %prol.iter65.cmp, label %vector.body.prol.loopexit.loopexit, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.loopexit:               ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.loopexit, %vector.body.preheader
  %index.unr = phi i32 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.loopexit ]
  br i1 false, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i32 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %5 = sext i32 %index to i64
  %6 = getelementptr inbounds double, double* %s, i64 %5
  %7 = bitcast double* %6 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  %8 = getelementptr double, double* %6, i64 2
  %9 = bitcast double* %8 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %index.next = add i32 %index, 4
  %10 = sext i32 %index.next to i64
  %11 = getelementptr inbounds double, double* %s, i64 %10
  %12 = bitcast double* %11 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %12, align 8
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %14, align 8
  %index.next.1 = add i32 %index, 8
  %15 = sext i32 %index.next.1 to i64
  %16 = getelementptr inbounds double, double* %s, i64 %15
  %17 = bitcast double* %16 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %17, align 8
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %19, align 8
  %index.next.2 = add i32 %index, 12
  %20 = sext i32 %index.next.2 to i64
  %21 = getelementptr inbounds double, double* %s, i64 %20
  %22 = bitcast double* %21 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %22, align 8
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %24, align 8
  %index.next.3 = add i32 %index, 16
  %25 = icmp eq i32 %index.next.3, 1900
  br i1 %25, label %middle.block.loopexit, label %vector.body, !llvm.loop !3

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  br i1 true, label %for.cond1.preheader, label %for.inc.preheader

for.cond1.preheader.loopexit:                     ; preds = %for.inc
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.loopexit, %middle.block, %entry
  br i1 true, label %for.body3.lr.ph, label %for.end36

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  br i1 true, label %for.body3.us.preheader, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.lr.ph
  br i1 false, label %for.body3.preheader61, label %min.iters.checked41

for.body3.preheader61:                            ; preds = %middle.block38, %min.iters.checked41, %for.body3.preheader
  %inc3511.ph = phi i32 [ 0, %min.iters.checked41 ], [ 0, %for.body3.preheader ], [ 2100, %middle.block38 ]
  br label %for.body3

min.iters.checked41:                              ; preds = %for.body3.preheader
  br i1 false, label %for.body3.preheader61, label %vector.body37.preheader

vector.body37.preheader:                          ; preds = %min.iters.checked41
  br i1 false, label %vector.body37.prol.loopexit, label %vector.body37.prol.preheader

vector.body37.prol.preheader:                     ; preds = %vector.body37.preheader
  br label %vector.body37.prol

vector.body37.prol:                               ; preds = %vector.body37.prol, %vector.body37.prol.preheader
  %index46.prol = phi i32 [ %index.next47.prol, %vector.body37.prol ], [ 0, %vector.body37.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %vector.body37.prol ], [ 1, %vector.body37.prol.preheader ]
  %26 = sext i32 %index46.prol to i64
  %27 = getelementptr inbounds double, double* %q, i64 %26
  %28 = bitcast double* %27 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %28, align 8
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %30, align 8
  %index.next47.prol = add i32 %index46.prol, 4
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body37.prol.loopexit.loopexit, label %vector.body37.prol, !llvm.loop !6

vector.body37.prol.loopexit.loopexit:             ; preds = %vector.body37.prol
  br label %vector.body37.prol.loopexit

vector.body37.prol.loopexit:                      ; preds = %vector.body37.prol.loopexit.loopexit, %vector.body37.preheader
  %index46.unr = phi i32 [ 0, %vector.body37.preheader ], [ %index.next47.prol, %vector.body37.prol.loopexit.loopexit ]
  br i1 false, label %middle.block38, label %vector.body37.preheader.new

vector.body37.preheader.new:                      ; preds = %vector.body37.prol.loopexit
  br label %vector.body37

vector.body37:                                    ; preds = %vector.body37, %vector.body37.preheader.new
  %index46 = phi i32 [ %index46.unr, %vector.body37.preheader.new ], [ %index.next47.3, %vector.body37 ]
  %31 = sext i32 %index46 to i64
  %32 = getelementptr inbounds double, double* %q, i64 %31
  %33 = bitcast double* %32 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %33, align 8
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %35, align 8
  %index.next47 = add i32 %index46, 4
  %36 = sext i32 %index.next47 to i64
  %37 = getelementptr inbounds double, double* %q, i64 %36
  %38 = bitcast double* %37 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %38, align 8
  %39 = getelementptr double, double* %37, i64 2
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %40, align 8
  %index.next47.1 = add i32 %index46, 8
  %41 = sext i32 %index.next47.1 to i64
  %42 = getelementptr inbounds double, double* %q, i64 %41
  %43 = bitcast double* %42 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %43, align 8
  %44 = getelementptr double, double* %42, i64 2
  %45 = bitcast double* %44 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %45, align 8
  %index.next47.2 = add i32 %index46, 12
  %46 = sext i32 %index.next47.2 to i64
  %47 = getelementptr inbounds double, double* %q, i64 %46
  %48 = bitcast double* %47 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %48, align 8
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %50, align 8
  %index.next47.3 = add i32 %index46, 16
  %51 = icmp eq i32 %index.next47.3, 2100
  br i1 %51, label %middle.block38.loopexit, label %vector.body37, !llvm.loop !7

middle.block38.loopexit:                          ; preds = %vector.body37
  br label %middle.block38

middle.block38:                                   ; preds = %middle.block38.loopexit, %vector.body37.prol.loopexit
  br i1 true, label %for.end36, label %for.body3.preheader61

for.body3.us.preheader:                           ; preds = %for.body3.lr.ph
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.cond6.for.inc34_crit_edge.us, %for.body3.us.preheader
  %indvars.iv18 = phi i64 [ 0, %for.body3.us.preheader ], [ %indvars.iv.next19, %for.cond6.for.inc34_crit_edge.us ]
  %sext = shl i64 %indvars.iv18, 32
  %idxprom4.us = ashr exact i64 %sext, 32
  %arrayidx5.us = getelementptr inbounds double, double* %q, i64 %idxprom4.us
  store double 0.000000e+00, double* %arrayidx5.us, align 8
  br label %for.inc31.us

for.inc31.us:                                     ; preds = %for.inc31.us, %for.body3.us
  %indvars.iv = phi i64 [ 0, %for.body3.us ], [ %indvars.iv.next, %for.inc31.us ]
  %arrayidx10.us = getelementptr inbounds double, double* %s, i64 %indvars.iv
  %52 = load double, double* %arrayidx10.us, align 8
  %sunkaddr = ptrtoint double* %r to i64
  %sunkaddr74 = mul i64 %indvars.iv18, 8
  %sunkaddr75 = add i64 %sunkaddr, %sunkaddr74
  %sunkaddr76 = inttoptr i64 %sunkaddr75 to double*
  %53 = load double, double* %sunkaddr76, align 8
  %arrayidx16.us = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv
  %54 = load double, double* %arrayidx16.us, align 8
  %mul.us = fmul double %53, %54
  %add.us = fadd double %52, %mul.us
  store double %add.us, double* %arrayidx10.us, align 8
  %sunkaddr77 = ptrtoint double* %q to i64
  %sunkaddr78 = mul i64 %indvars.iv18, 8
  %sunkaddr79 = add i64 %sunkaddr77, %sunkaddr78
  %sunkaddr80 = inttoptr i64 %sunkaddr79 to double*
  %55 = load double, double* %sunkaddr80, align 8
  %56 = load double, double* %arrayidx16.us, align 8
  %arrayidx26.us = getelementptr inbounds double, double* %p, i64 %indvars.iv
  %57 = load double, double* %arrayidx26.us, align 8
  %mul27.us = fmul double %56, %57
  %add28.us = fadd double %55, %mul27.us
  store double %add28.us, double* %sunkaddr80, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp7.us = icmp slt i64 %indvars.iv.next, 1900
  br i1 %cmp7.us, label %for.inc31.us, label %for.cond6.for.inc34_crit_edge.us

for.cond6.for.inc34_crit_edge.us:                 ; preds = %for.inc31.us
  %indvars.iv.next19 = add i64 %indvars.iv18, 1
  %cmp2.us = icmp slt i64 %indvars.iv.next19, 2100
  br i1 %cmp2.us, label %for.body3.us, label %for.end36.loopexit

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %inc15 = phi i32 [ %inc, %for.inc ], [ %inc15.ph, %for.inc.preheader ]
  %idxprom = sext i32 %inc15 to i64
  %arrayidx = getelementptr inbounds double, double* %s, i64 %idxprom
  store double 0.000000e+00, double* %arrayidx, align 8
  %inc = add nsw i32 %inc15, 1
  %cmp = icmp slt i32 %inc, 1900
  br i1 %cmp, label %for.inc, label %for.cond1.preheader.loopexit, !llvm.loop !8

for.body3:                                        ; preds = %for.body3.preheader61, %for.body3
  %inc3511 = phi i32 [ %inc35, %for.body3 ], [ %inc3511.ph, %for.body3.preheader61 ]
  %idxprom4 = sext i32 %inc3511 to i64
  %arrayidx5 = getelementptr inbounds double, double* %q, i64 %idxprom4
  store double 0.000000e+00, double* %arrayidx5, align 8
  %inc35 = add nsw i32 %inc3511, 1
  %cmp2 = icmp slt i32 %inc35, 2100
  br i1 %cmp2, label %for.body3, label %for.end36.loopexit81, !llvm.loop !10

for.end36.loopexit:                               ; preds = %for.cond6.for.inc34_crit_edge.us
  br label %for.end36

for.end36.loopexit81:                             ; preds = %for.body3
  br label %for.end36

for.end36:                                        ; preds = %for.end36.loopexit81, %for.end36.loopexit, %middle.block38, %for.cond1.preheader
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %m, i32 %n, double* %s, double* %q) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %for.inc ], [ 0, %for.body.lr.ph ]
  %storemerge8 = phi i32 [ %6, %for.inc ], [ 0, %for.body.lr.ph ]
  %rem = srem i32 %storemerge8, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc4 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %3) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %s, i64 %indvars.iv12
  %5 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %5) #6
  %indvars.iv.next13 = add i64 %indvars.iv12, 1
  %cmp = icmp slt i64 %indvars.iv.next13, 1900
  %6 = trunc i64 %indvars.iv.next13 to i32
  br i1 %cmp, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  br i1 true, label %for.body9.lr.ph, label %for.end20

for.body9.lr.ph:                                  ; preds = %for.end
  br label %for.body9

for.body9:                                        ; preds = %for.inc18, %for.body9.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc18 ], [ 0, %for.body9.lr.ph ]
  %storemerge16 = phi i32 [ %12, %for.inc18 ], [ 0, %for.body9.lr.ph ]
  %rem10 = srem i32 %storemerge16, 20
  %cmp11 = icmp eq i32 %rem10, 0
  br i1 %cmp11, label %if.then12, label %for.inc18

if.then12:                                        ; preds = %for.body9
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #5
  br label %for.inc18

for.inc18:                                        ; preds = %for.body9, %if.then12
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds double, double* %q, i64 %indvars.iv
  %11 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %11) #6
  %indvars.iv.next = add i64 %indvars.iv, 1
  %cmp8 = icmp slt i64 %indvars.iv.next, 2100
  %12 = trunc i64 %indvars.iv.next to i32
  br i1 %cmp8, label %for.body9, label %for.end20.loopexit

for.end20.loopexit:                               ; preds = %for.inc18
  br label %for.end20

for.end20:                                        ; preds = %for.end20.loopexit, %for.end
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %14) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !2}
!7 = distinct !{!7, !4, !5}
!8 = distinct !{!8, !9, !4, !5}
!9 = !{!"llvm.loop.unroll.runtime.disable"}
!10 = distinct !{!10, !9, !4, !5}
