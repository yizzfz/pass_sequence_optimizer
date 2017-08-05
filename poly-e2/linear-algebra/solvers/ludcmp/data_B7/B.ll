; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  %arraydecay5 = bitcast i8* %call2 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call void @init_array(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_ludcmp(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call void @print_array(i32 2000, double* %arraydecay5)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32 %n, [2000 x double]* %A, double* %b, double* %x, double* %y) #0 {
entry:
  %A.addr = alloca [2000 x double]*, align 8
  %B = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br i1 true, label %for.body.lr.ph, label %for.end46.thread

for.body.lr.ph:                                   ; preds = %entry
  br i1 true, label %for.body.prol.loopexit, label %for.body.prol.preheader

for.body.prol.preheader:                          ; preds = %for.body.lr.ph
  store double 0.000000e+00, double* %x, align 8
  store double 0.000000e+00, double* %y, align 8
  %div.prol = fdiv double 1.000000e+00, 2.000000e+03
  %div5.prol = fmul double %div.prol, 5.000000e-01
  %add6.prol = fadd double %div5.prol, 4.000000e+00
  store double %add6.prol, double* %b, align 8
  br label %for.body.prol.loopexit

for.body.prol.loopexit:                           ; preds = %for.body.lr.ph, %for.body.prol.preheader
  %indvars.iv130.unr = phi i64 [ 0, %for.body.lr.ph ], [ 1, %for.body.prol.preheader ]
  br i1 false, label %for.end, label %for.body.preheader

for.body.preheader:                               ; preds = %for.body.prol.loopexit
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv130 = phi i64 [ %indvars.iv.next131.1, %for.body ], [ %indvars.iv130.unr, %for.body.preheader ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv130
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv130
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  %2 = trunc i64 %indvars.iv.next131 to i32
  %conv4 = sitofp i32 %2 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv130
  store <2 x double> zeroinitializer, <2 x double>* %0, align 8
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %indvars.iv.next131.1 = add nuw nsw i64 %indvars.iv130, 2
  %3 = trunc i64 %indvars.iv.next131.1 to i32
  %conv4.1 = sitofp i32 %3 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %4 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %4, align 8
  %exitcond133.1 = icmp eq i64 %indvars.iv.next131.1, 2000
  br i1 %exitcond133.1, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body.prol.loopexit
  br i1 true, label %for.body12.lr.ph, label %for.end.for.end46.thread_crit_edge

for.end.for.end46.thread_crit_edge:               ; preds = %for.end
  br label %for.end46.thread

for.body12.lr.ph:                                 ; preds = %for.end
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body16.lr.ph

for.body16.lr.ph:                                 ; preds = %for.body12.lr.ph, %for.end39
  %indvars.iv151 = phi i3 [ -1, %for.body12.lr.ph ], [ %indvars.iv.next152, %for.end39 ]
  %indvars.iv149 = phi i64 [ 2, %for.body12.lr.ph ], [ %indvars.iv.next150, %for.end39 ]
  %indvars.iv126 = phi i64 [ 0, %for.body12.lr.ph ], [ %indvars.iv.next127, %for.end39 ]
  %indvars.iv124 = phi i64 [ 1, %for.body12.lr.ph ], [ %indvars.iv.next125, %for.end39 ]
  %5 = phi [2000 x double]* [ %A, %for.body12.lr.ph ], [ %.pre, %for.end39 ]
  %6 = zext i3 %indvars.iv151 to i64
  %7 = add nuw nsw i64 %6, 4294967295
  %8 = and i64 %7, 4294967295
  %9 = add i64 %indvars.iv149, %8
  %10 = sub nsw i64 0, %indvars.iv126
  %11 = trunc i64 %10 to i32
  %12 = add i32 2007, %11
  br label %for.body16

for.body16:                                       ; preds = %for.body16, %for.body16.lr.ph
  %indvars.iv108 = phi i64 [ 0, %for.body16.lr.ph ], [ %indvars.iv.next109, %for.body16 ]
  %13 = sub nsw i64 0, %indvars.iv108
  %14 = trunc i64 %13 to i32
  %rem = srem i32 %14, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv126, i64 %indvars.iv108
  store double %add20, double* %arrayidx24, align 8
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond114 = icmp eq i64 %indvars.iv.next109, %indvars.iv124
  br i1 %exitcond114, label %for.end27, label %for.body16

for.end27:                                        ; preds = %for.body16
  %15 = add i32 1998, %11
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %cmp3059 = icmp slt i64 %indvars.iv.next127, 2000
  br i1 %cmp3059, label %for.body32.lr.ph, label %for.end39

for.body32.lr.ph:                                 ; preds = %for.end27
  %xtraiter121 = and i32 %12, 7
  %lcmp.mod122 = icmp eq i32 %xtraiter121, 0
  br i1 %lcmp.mod122, label %for.body32.prol.loopexit, label %for.body32.prol.preheader

for.body32.prol.preheader:                        ; preds = %for.body32.lr.ph
  br label %for.body32.prol

for.body32.prol:                                  ; preds = %for.body32.prol.preheader, %for.body32.prol
  %indvars.iv117.prol = phi i64 [ %indvars.iv.next118.prol, %for.body32.prol ], [ %indvars.iv124, %for.body32.prol.preheader ]
  %prol.iter123 = phi i32 [ %prol.iter123.sub, %for.body32.prol ], [ %xtraiter121, %for.body32.prol.preheader ]
  %arrayidx36.prol = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv126, i64 %indvars.iv117.prol
  store double 0.000000e+00, double* %arrayidx36.prol, align 8
  %indvars.iv.next118.prol = add nuw nsw i64 %indvars.iv117.prol, 1
  %prol.iter123.sub = add nsw i32 %prol.iter123, -1
  %prol.iter123.cmp = icmp eq i32 %prol.iter123.sub, 0
  br i1 %prol.iter123.cmp, label %for.body32.prol.loopexit.loopexit, label %for.body32.prol, !llvm.loop !1

for.body32.prol.loopexit.loopexit:                ; preds = %for.body32.prol
  br label %for.body32.prol.loopexit

for.body32.prol.loopexit:                         ; preds = %for.body32.prol.loopexit.loopexit, %for.body32.lr.ph
  %indvars.iv117.unr = phi i64 [ %indvars.iv124, %for.body32.lr.ph ], [ %9, %for.body32.prol.loopexit.loopexit ]
  %16 = icmp ult i32 %15, 7
  br i1 %16, label %for.end39, label %for.body32.preheader

for.body32.preheader:                             ; preds = %for.body32.prol.loopexit
  br label %for.body32

for.body32:                                       ; preds = %for.body32.preheader, %for.body32
  %indvars.iv117 = phi i64 [ %indvars.iv.next118.7, %for.body32 ], [ %indvars.iv117.unr, %for.body32.preheader ]
  %arrayidx36 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv126, i64 %indvars.iv117
  store double 0.000000e+00, double* %arrayidx36, align 8
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %arrayidx36.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv126, i64 %indvars.iv.next118
  store double 0.000000e+00, double* %arrayidx36.1, align 8
  %indvars.iv.next118.1 = add nsw i64 %indvars.iv117, 2
  %arrayidx36.2 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv126, i64 %indvars.iv.next118.1
  store double 0.000000e+00, double* %arrayidx36.2, align 8
  %indvars.iv.next118.2 = add nsw i64 %indvars.iv117, 3
  %arrayidx36.3 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv126, i64 %indvars.iv.next118.2
  store double 0.000000e+00, double* %arrayidx36.3, align 8
  %indvars.iv.next118.3 = add nsw i64 %indvars.iv117, 4
  %arrayidx36.4 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv126, i64 %indvars.iv.next118.3
  store double 0.000000e+00, double* %arrayidx36.4, align 8
  %indvars.iv.next118.4 = add nsw i64 %indvars.iv117, 5
  %arrayidx36.5 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv126, i64 %indvars.iv.next118.4
  store double 0.000000e+00, double* %arrayidx36.5, align 8
  %indvars.iv.next118.5 = add nsw i64 %indvars.iv117, 6
  %arrayidx36.6 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv126, i64 %indvars.iv.next118.5
  store double 0.000000e+00, double* %arrayidx36.6, align 8
  %indvars.iv.next118.6 = add nsw i64 %indvars.iv117, 7
  %arrayidx36.7 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv126, i64 %indvars.iv.next118.6
  store double 0.000000e+00, double* %arrayidx36.7, align 8
  %indvars.iv.next118.7 = add nsw i64 %indvars.iv117, 8
  %exitcond120.7 = icmp eq i64 %indvars.iv.next118.7, 2000
  br i1 %exitcond120.7, label %for.end39.loopexit, label %for.body32

for.end39.loopexit:                               ; preds = %for.body32
  br label %for.end39

for.end39:                                        ; preds = %for.end39.loopexit, %for.body32.prol.loopexit, %for.end27
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv126, i64 %indvars.iv126
  store double 1.000000e+00, double* %arrayidx43, align 8
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %exitcond129 = icmp eq i64 %indvars.iv.next127, 2000
  %indvars.iv.next150 = add nuw i64 %indvars.iv149, 1
  %indvars.iv.next152 = add i3 %indvars.iv151, -1
  br i1 %exitcond129, label %for.end46, label %for.body16.lr.ph

for.end46.thread:                                 ; preds = %for.end.for.end46.thread_crit_edge, %entry
  %call141 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %17 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call141, i8** %17, align 8
  br label %for.cond99.preheader.for.end120_crit_edge

for.end46:                                        ; preds = %for.end39
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %18 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %18, align 8
  %19 = bitcast i8* %call to [2000 x [2000 x double]]*
  br i1 true, label %for.body50.us.preheader, label %for.end46.for.cond99.preheader.for.end120_crit_edge_crit_edge

for.end46.for.cond99.preheader.for.end120_crit_edge_crit_edge: ; preds = %for.end46
  br label %for.cond99.preheader.for.end120_crit_edge

for.body50.us.preheader:                          ; preds = %for.end46
  br i1 true, label %for.body50.us.prol.loopexit, label %for.body50.us.prol.preheader

for.body50.us.prol.preheader:                     ; preds = %for.body50.us.preheader
  %20 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.body50.us.prol

for.body50.us.prol:                               ; preds = %for.body50.us.prol.preheader, %for.body50.us.prol
  %indvars.iv100.prol = phi i64 [ %indvars.iv.next101.prol, %for.body50.us.prol ], [ 0, %for.body50.us.prol.preheader ]
  %prol.iter106 = phi i32 [ %prol.iter106.sub, %for.body50.us.prol ], [ 0, %for.body50.us.prol.preheader ]
  %scevgep.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv100.prol, i64 0
  %scevgep99.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep99.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next101.prol = add nuw nsw i64 %indvars.iv100.prol, 1
  %prol.iter106.sub = add nsw i32 %prol.iter106, -1
  %prol.iter106.cmp = icmp eq i32 %prol.iter106.sub, 0
  br i1 %prol.iter106.cmp, label %for.body50.us.prol.loopexit.loopexit, label %for.body50.us.prol, !llvm.loop !3

for.body50.us.prol.loopexit.loopexit:             ; preds = %for.body50.us.prol
  br label %for.body50.us.prol.loopexit

for.body50.us.prol.loopexit:                      ; preds = %for.body50.us.prol.loopexit.loopexit, %for.body50.us.preheader
  %indvars.iv100.unr = phi i64 [ 0, %for.body50.us.preheader ], [ 4294967296, %for.body50.us.prol.loopexit.loopexit ]
  br i1 false, label %for.end64, label %for.body50.us.preheader143

for.body50.us.preheader143:                       ; preds = %for.body50.us.prol.loopexit
  %21 = sub nsw i64 1996, %indvars.iv100.unr
  %22 = lshr i64 %21, 2
  %23 = and i64 %22, 1
  %lcmp.mod = icmp eq i64 %23, 0
  br i1 %lcmp.mod, label %for.body50.us.prol.preheader154, label %for.body50.us.prol.loopexit155

for.body50.us.prol.preheader154:                  ; preds = %for.body50.us.preheader143
  br label %for.body50.us.prol156

for.body50.us.prol156:                            ; preds = %for.body50.us.prol.preheader154
  %24 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep.prol158 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv100.unr, i64 0
  %scevgep99.prol159 = bitcast double* %scevgep.prol158 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep99.prol159, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next101.prol160 = add nuw nsw i64 %indvars.iv100.unr, 1
  %scevgep.1.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv.next101.prol160, i64 0
  %scevgep99.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep99.1.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next101.1.prol = add nsw i64 %indvars.iv100.unr, 2
  %scevgep.2.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv.next101.1.prol, i64 0
  %scevgep99.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep99.2.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next101.2.prol = add nsw i64 %indvars.iv100.unr, 3
  %scevgep.3.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv.next101.2.prol, i64 0
  %scevgep99.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep99.3.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next101.3.prol = add nsw i64 %indvars.iv100.unr, 4
  br label %for.body50.us.prol.loopexit155

for.body50.us.prol.loopexit155:                   ; preds = %for.body50.us.prol156, %for.body50.us.preheader143
  %indvars.iv100.unr161 = phi i64 [ %indvars.iv100.unr, %for.body50.us.preheader143 ], [ %indvars.iv.next101.3.prol, %for.body50.us.prol156 ]
  %25 = icmp eq i64 %22, 0
  br i1 %25, label %for.end64.loopexit, label %for.body50.us.preheader143.new

for.body50.us.preheader143.new:                   ; preds = %for.body50.us.prol.loopexit155
  %26 = bitcast i8* %call to [2000 x [2000 x double]]*
  %27 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.body50.us

for.body50.us:                                    ; preds = %for.body50.us, %for.body50.us.preheader143.new
  %indvars.iv100 = phi i64 [ %indvars.iv100.unr161, %for.body50.us.preheader143.new ], [ %indvars.iv.next101.3.1, %for.body50.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv100, i64 0
  %scevgep99 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep99, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv.next101, i64 0
  %scevgep99.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep99.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next101.1 = add nsw i64 %indvars.iv100, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv.next101.1, i64 0
  %scevgep99.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep99.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next101.2 = add nsw i64 %indvars.iv100, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv.next101.2, i64 0
  %scevgep99.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep99.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next101.3 = add nsw i64 %indvars.iv100, 4
  %scevgep.1162 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv.next101.3, i64 0
  %scevgep99.1163 = bitcast double* %scevgep.1162 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep99.1163, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next101.1164 = add nsw i64 %indvars.iv100, 5
  %scevgep.1.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv.next101.1164, i64 0
  %scevgep99.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep99.1.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next101.1.1 = add nsw i64 %indvars.iv100, 6
  %scevgep.2.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv.next101.1.1, i64 0
  %scevgep99.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep99.2.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next101.2.1 = add nsw i64 %indvars.iv100, 7
  %scevgep.3.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv.next101.2.1, i64 0
  %scevgep99.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep99.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next101.3.1 = add nsw i64 %indvars.iv100, 8
  %exitcond103.3.1 = icmp eq i64 %indvars.iv.next101.3.1, 2000
  br i1 %exitcond103.3.1, label %for.end64.loopexit.unr-lcssa, label %for.body50.us

for.end64.loopexit.unr-lcssa:                     ; preds = %for.body50.us
  br label %for.end64.loopexit

for.end64.loopexit:                               ; preds = %for.body50.us.prol.loopexit155, %for.end64.loopexit.unr-lcssa
  br label %for.end64

for.end64:                                        ; preds = %for.end64.loopexit, %for.body50.us.prol.loopexit
  br i1 true, label %for.cond69.preheader.us.preheader, label %for.end64.for.cond99.preheader.for.end120_crit_edge_crit_edge

for.end64.for.cond99.preheader.for.end120_crit_edge_crit_edge: ; preds = %for.end64
  br label %for.cond99.preheader.for.end120_crit_edge

for.cond69.preheader.us.preheader:                ; preds = %for.end64
  %sunkaddr = ptrtoint [2000 x double]* %.pre to i64
  br label %for.body72.lr.ph.us

for.inc96.us:                                     ; preds = %for.cond73.for.inc93_crit_edge.us.us
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next90, %wide.trip.count87.pre-phi
  br i1 %exitcond92, label %for.cond99.preheader, label %for.body72.lr.ph.us

for.body72.lr.ph.us:                              ; preds = %for.cond69.preheader.us.preheader, %for.inc96.us
  %indvars.iv89 = phi i64 [ 0, %for.cond69.preheader.us.preheader ], [ %indvars.iv.next90, %for.inc96.us ]
  %sunkaddr144 = shl nuw nsw i64 %indvars.iv89, 3
  %sunkaddr145 = add i64 %sunkaddr, %sunkaddr144
  %sunkaddr146 = inttoptr i64 %sunkaddr145 to double*
  br label %for.body72.us.us

for.body72.us.us:                                 ; preds = %for.cond73.for.inc93_crit_edge.us.us, %for.body72.lr.ph.us
  %indvars.iv85 = phi i64 [ 0, %for.body72.lr.ph.us ], [ %indvars.iv.next86, %for.cond73.for.inc93_crit_edge.us.us ]
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv85, i64 %indvars.iv89
  br i1 true, label %for.body76.us.us.prol.loopexit.unr-lcssa, label %for.body76.us.us.prol.preheader

for.body76.us.us.prol.preheader:                  ; preds = %for.body72.us.us
  %28 = load double, double* %arrayidx80.us.us, align 8
  %29 = load double, double* %sunkaddr146, align 8
  %mul.us.us.prol = fmul double %28, %29
  %arrayidx88.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv85, i64 0
  %30 = load double, double* %arrayidx88.us.us.prol, align 8
  %add89.us.us.prol = fadd double %mul.us.us.prol, %30
  store double %add89.us.us.prol, double* %arrayidx88.us.us.prol, align 8
  br label %for.body76.us.us.prol.loopexit.unr-lcssa

for.body76.us.us.prol.loopexit.unr-lcssa:         ; preds = %for.body72.us.us, %for.body76.us.us.prol.preheader
  %indvars.iv79.unr.ph = phi i64 [ 1, %for.body76.us.us.prol.preheader ], [ 0, %for.body72.us.us ]
  br i1 false, label %for.cond73.for.inc93_crit_edge.us.us, label %for.body76.us.us.preheader

for.body76.us.us.preheader:                       ; preds = %for.body76.us.us.prol.loopexit.unr-lcssa
  br label %for.body76.us.us

for.cond73.for.inc93_crit_edge.us.us.loopexit:    ; preds = %for.body76.us.us
  br label %for.cond73.for.inc93_crit_edge.us.us

for.cond73.for.inc93_crit_edge.us.us:             ; preds = %for.cond73.for.inc93_crit_edge.us.us.loopexit, %for.body76.us.us.prol.loopexit.unr-lcssa
  %wide.trip.count87.pre-phi = phi i64 [ 1, %for.body76.us.us.prol.loopexit.unr-lcssa ], [ 2000, %for.cond73.for.inc93_crit_edge.us.us.loopexit ]
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next86, %wide.trip.count87.pre-phi
  br i1 %exitcond88, label %for.inc96.us, label %for.body72.us.us

for.body76.us.us:                                 ; preds = %for.body76.us.us.preheader, %for.body76.us.us
  %indvars.iv79 = phi i64 [ %indvars.iv.next80.1, %for.body76.us.us ], [ %indvars.iv79.unr.ph, %for.body76.us.us.preheader ]
  %31 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv79, i64 %indvars.iv89
  %32 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %31, %32
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv85, i64 %indvars.iv79
  %33 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %mul.us.us, %33
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %34 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv.next80, i64 %indvars.iv89
  %35 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %34, %35
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv85, i64 %indvars.iv.next80
  %36 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %mul.us.us.1, %36
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %indvars.iv.next80.1 = add nuw nsw i64 %indvars.iv79, 2
  %exitcond82.1 = icmp eq i64 %indvars.iv.next80.1, 2000
  br i1 %exitcond82.1, label %for.cond73.for.inc93_crit_edge.us.us.loopexit, label %for.body76.us.us

for.cond99.preheader:                             ; preds = %for.inc96.us
  br i1 true, label %for.body102.us.preheader, label %for.cond99.preheader.for.cond99.preheader.for.end120_crit_edge_crit_edge

for.cond99.preheader.for.cond99.preheader.for.end120_crit_edge_crit_edge: ; preds = %for.cond99.preheader
  br label %for.cond99.preheader.for.end120_crit_edge

for.cond99.preheader.for.end120_crit_edge:        ; preds = %for.cond99.preheader.for.cond99.preheader.for.end120_crit_edge_crit_edge, %for.end64.for.cond99.preheader.for.end120_crit_edge_crit_edge, %for.end46.for.cond99.preheader.for.end120_crit_edge_crit_edge, %for.end46.thread
  %.pre72 = phi i8* [ undef, %for.cond99.preheader.for.cond99.preheader.for.end120_crit_edge_crit_edge ], [ %call, %for.end64.for.cond99.preheader.for.end120_crit_edge_crit_edge ], [ %call, %for.end46.for.cond99.preheader.for.end120_crit_edge_crit_edge ], [ %call141, %for.end46.thread ]
  br label %for.end120

for.body102.us.preheader:                         ; preds = %for.cond99.preheader
  %37 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %38 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body102.us

for.body102.us:                                   ; preds = %for.cond103.for.inc118_crit_edge.us, %for.body102.us.preheader
  %indvars.iv75 = phi i64 [ 0, %for.body102.us.preheader ], [ %indvars.iv.next76, %for.cond103.for.inc118_crit_edge.us ]
  br i1 true, label %for.body106.us.prol.loopexit, label %for.body106.us.prol.preheader

for.body106.us.prol.preheader:                    ; preds = %for.body102.us
  br label %for.body106.us.prol

for.body106.us.prol:                              ; preds = %for.body106.us.prol.preheader, %for.body106.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body106.us.prol ], [ 0, %for.body106.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body106.us.prol ], [ 0, %for.body106.us.prol.preheader ]
  %arrayidx110.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv75, i64 %indvars.iv.prol
  %39 = bitcast double* %arrayidx110.us.prol to i64*
  %40 = load i64, i64* %39, align 8
  %arrayidx114.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %38, i64 %indvars.iv75, i64 %indvars.iv.prol
  %41 = bitcast double* %arrayidx114.us.prol to i64*
  store i64 %40, i64* %41, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body106.us.prol.loopexit.loopexit, label %for.body106.us.prol, !llvm.loop !4

for.body106.us.prol.loopexit.loopexit:            ; preds = %for.body106.us.prol
  br label %for.body106.us.prol.loopexit

for.body106.us.prol.loopexit:                     ; preds = %for.body106.us.prol.loopexit.loopexit, %for.body102.us
  %indvars.iv.unr = phi i64 [ 0, %for.body102.us ], [ 4294967296, %for.body106.us.prol.loopexit.loopexit ]
  br i1 false, label %for.cond103.for.inc118_crit_edge.us, label %for.body106.us.preheader

for.body106.us.preheader:                         ; preds = %for.body106.us.prol.loopexit
  br label %for.body106.us

for.body106.us:                                   ; preds = %for.body106.us.preheader, %for.body106.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body106.us ], [ %indvars.iv.unr, %for.body106.us.preheader ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv75, i64 %indvars.iv
  %42 = bitcast double* %arrayidx110.us to i64*
  %43 = load i64, i64* %42, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %38, i64 %indvars.iv75, i64 %indvars.iv
  %44 = bitcast double* %arrayidx114.us to i64*
  store i64 %43, i64* %44, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next
  %45 = bitcast double* %arrayidx110.us.1 to i64*
  %46 = load i64, i64* %45, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %38, i64 %indvars.iv75, i64 %indvars.iv.next
  %47 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %46, i64* %47, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next.1
  %48 = bitcast double* %arrayidx110.us.2 to i64*
  %49 = load i64, i64* %48, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %38, i64 %indvars.iv75, i64 %indvars.iv.next.1
  %50 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %49, i64* %50, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next.2
  %51 = bitcast double* %arrayidx110.us.3 to i64*
  %52 = load i64, i64* %51, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %38, i64 %indvars.iv75, i64 %indvars.iv.next.2
  %53 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %52, i64* %53, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %for.cond103.for.inc118_crit_edge.us.loopexit, label %for.body106.us

for.cond103.for.inc118_crit_edge.us.loopexit:     ; preds = %for.body106.us
  br label %for.cond103.for.inc118_crit_edge.us

for.cond103.for.inc118_crit_edge.us:              ; preds = %for.cond103.for.inc118_crit_edge.us.loopexit, %for.body106.us.prol.loopexit
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond = icmp eq i64 %indvars.iv.next76, 2000
  br i1 %exitcond, label %for.end120.loopexit, label %for.body102.us

for.end120.loopexit:                              ; preds = %for.cond103.for.inc118_crit_edge.us
  %54 = bitcast [2000 x [2000 x double]]* %37 to i8*
  br label %for.end120

for.end120:                                       ; preds = %for.end120.loopexit, %for.cond99.preheader.for.end120_crit_edge
  %55 = phi i8* [ %.pre72, %for.cond99.preheader.for.end120_crit_edge ], [ %54, %for.end120.loopexit ]
  tail call void @free(i8* %55) #4
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_ludcmp(i32 %n, [2000 x double]* %A, double* %b, double* %x, double* %y) #0 {
entry:
  br i1 true, label %for.body.lr.ph, label %for.end113

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.inc58, %for.body.lr.ph
  %indvars.iv133 = phi i2 [ %indvars.iv.next134, %for.inc58 ], [ 0, %for.body.lr.ph ]
  %indvars.iv131 = phi i64 [ %indvars.iv.next132, %for.inc58 ], [ 1, %for.body.lr.ph ]
  %indvars.iv113 = phi i64 [ %indvars.iv.next114, %for.inc58 ], [ 0, %for.body.lr.ph ]
  %0 = zext i2 %indvars.iv133 to i64
  %1 = add nuw nsw i64 %0, 4294967295
  %2 = and i64 %1, 4294967295
  %3 = add i64 %indvars.iv131, %2
  %4 = add nuw i64 %indvars.iv113, 4294967295
  %5 = sub i64 2000, %indvars.iv113
  %6 = trunc i64 %5 to i32
  %7 = sub i64 1999, %indvars.iv113
  %8 = trunc i64 %7 to i32
  %cmp222 = icmp sgt i64 %indvars.iv113, 0
  br i1 %cmp222, label %for.body3.preheader, label %for.body30.preheader

for.body3.preheader:                              ; preds = %for.body
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 0
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.end
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %for.end ], [ 0, %for.body3.preheader ]
  %9 = add nuw i64 %indvars.iv78, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv78
  %10 = load double, double* %arrayidx5, align 8
  %cmp719 = icmp sgt i64 %indvars.iv78, 0
  br i1 %cmp719, label %for.body8.lr.ph, label %for.end

for.body8.lr.ph:                                  ; preds = %for.body3
  %xtraiter74118 = and i64 %indvars.iv78, 1
  %lcmp.mod75 = icmp eq i64 %xtraiter74118, 0
  br i1 %lcmp.mod75, label %for.body8.prol.loopexit.unr-lcssa, label %for.body8.prol.preheader

for.body8.prol.preheader:                         ; preds = %for.body8.lr.ph
  %11 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv78
  %12 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %11, %12
  %sub.prol = fsub double %10, %mul.prol
  br label %for.body8.prol.loopexit.unr-lcssa

for.body8.prol.loopexit.unr-lcssa:                ; preds = %for.body8.lr.ph, %for.body8.prol.preheader
  %indvars.iv67.unr.ph = phi i64 [ 1, %for.body8.prol.preheader ], [ 0, %for.body8.lr.ph ]
  %sub21.unr.ph = phi double [ %sub.prol, %for.body8.prol.preheader ], [ %10, %for.body8.lr.ph ]
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body8.prol.preheader ], [ undef, %for.body8.lr.ph ]
  %13 = trunc i64 %9 to i32
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %for.end, label %for.body8.preheader

for.body8.preheader:                              ; preds = %for.body8.prol.loopexit.unr-lcssa
  br label %for.body8

for.body8:                                        ; preds = %for.body8.preheader, %for.body8
  %indvars.iv67 = phi i64 [ %indvars.iv.next68.1, %for.body8 ], [ %indvars.iv67.unr.ph, %for.body8.preheader ]
  %sub21 = phi double [ %sub.1, %for.body8 ], [ %sub21.unr.ph, %for.body8.preheader ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv67
  %15 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv67, i64 %indvars.iv78
  %16 = load double, double* %arrayidx16, align 8
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %17 = load <2 x double>, <2 x double>* %15, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next68, i64 %indvars.iv78
  %18 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %16, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %18, i32 1
  %mul = fmul <2 x double> %17, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %sub21, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %indvars.iv.next68.1 = add nuw nsw i64 %indvars.iv67, 2
  %exitcond73.1 = icmp eq i64 %indvars.iv.next68.1, %indvars.iv78
  br i1 %exitcond73.1, label %for.end.loopexit, label %for.body8

for.end.loopexit:                                 ; preds = %for.body8
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body8.prol.loopexit.unr-lcssa, %for.body3
  %sub.lcssa26 = phi double [ %10, %for.body3 ], [ %sub.lcssa.unr.ph, %for.body8.prol.loopexit.unr-lcssa ], [ %sub.1, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv78, i64 %indvars.iv78
  %19 = load double, double* %arrayidx20, align 8
  %div = fdiv double %sub.lcssa26, %19
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next79, %indvars.iv113
  br i1 %exitcond83, label %for.body30.lr.ph, label %for.body3

for.body30.lr.ph:                                 ; preds = %for.end
  br i1 true, label %for.body30.us.preheader, label %for.body30.lr.ph.for.body30.preheader_crit_edge

for.body30.lr.ph.for.body30.preheader_crit_edge:  ; preds = %for.body30.lr.ph
  br label %for.body30.preheader

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %xtraiter101117 = and i64 %indvars.iv113, 1
  %20 = trunc i64 %4 to i32
  %21 = icmp eq i64 %xtraiter101117, 0
  %22 = icmp eq i32 %20, 0
  br label %for.body30.us

for.body30.preheader:                             ; preds = %for.body30.lr.ph.for.body30.preheader_crit_edge, %for.body
  %xtraiter90 = and i32 %6, 3
  %lcmp.mod91 = icmp eq i32 %xtraiter90, 0
  br i1 %lcmp.mod91, label %for.body30.prol.loopexit, label %for.body30.prol.preheader

for.body30.prol.preheader:                        ; preds = %for.body30.preheader
  br label %for.body30.prol

for.body30.prol:                                  ; preds = %for.body30.prol.preheader, %for.body30.prol
  %prol.iter92 = phi i32 [ %prol.iter92.sub, %for.body30.prol ], [ %xtraiter90, %for.body30.prol.preheader ]
  %prol.iter92.sub = add nsw i32 %prol.iter92, -1
  %prol.iter92.cmp = icmp eq i32 %prol.iter92.sub, 0
  br i1 %prol.iter92.cmp, label %for.body30.prol.loopexit.loopexit, label %for.body30.prol, !llvm.loop !5

for.body30.prol.loopexit.loopexit:                ; preds = %for.body30.prol
  br label %for.body30.prol.loopexit

for.body30.prol.loopexit:                         ; preds = %for.body30.prol.loopexit.loopexit, %for.body30.preheader
  %indvars.iv86.unr = phi i64 [ %indvars.iv113, %for.body30.preheader ], [ %3, %for.body30.prol.loopexit.loopexit ]
  %23 = icmp ult i32 %8, 3
  br i1 %23, label %for.inc58, label %for.body30.preheader135

for.body30.preheader135:                          ; preds = %for.body30.prol.loopexit
  %24 = sub i64 1996, %indvars.iv86.unr
  %25 = lshr i64 %24, 2
  %26 = add nuw nsw i64 %25, 1
  %xtraiter139 = and i64 %26, 7
  %lcmp.mod140 = icmp eq i64 %xtraiter139, 0
  br i1 %lcmp.mod140, label %for.body30.prol.loopexit138, label %for.body30.prol.preheader137

for.body30.prol.preheader137:                     ; preds = %for.body30.preheader135
  br label %for.body30.prol141

for.body30.prol141:                               ; preds = %for.body30.prol141, %for.body30.prol.preheader137
  %indvars.iv86.prol = phi i64 [ %indvars.iv.next87.3.prol, %for.body30.prol141 ], [ %indvars.iv86.unr, %for.body30.prol.preheader137 ]
  %prol.iter142 = phi i64 [ %prol.iter142.sub, %for.body30.prol141 ], [ %xtraiter139, %for.body30.prol.preheader137 ]
  %indvars.iv.next87.3.prol = add nsw i64 %indvars.iv86.prol, 4
  %prol.iter142.sub = add i64 %prol.iter142, -1
  %prol.iter142.cmp = icmp eq i64 %prol.iter142.sub, 0
  br i1 %prol.iter142.cmp, label %for.body30.prol.loopexit138.unr-lcssa, label %for.body30.prol141, !llvm.loop !6

for.body30.prol.loopexit138.unr-lcssa:            ; preds = %for.body30.prol141
  br label %for.body30.prol.loopexit138

for.body30.prol.loopexit138:                      ; preds = %for.body30.preheader135, %for.body30.prol.loopexit138.unr-lcssa
  %indvars.iv86.unr143 = phi i64 [ %indvars.iv86.unr, %for.body30.preheader135 ], [ %indvars.iv.next87.3.prol, %for.body30.prol.loopexit138.unr-lcssa ]
  %27 = icmp ult i64 %24, 28
  br i1 %27, label %for.inc58.loopexit136, label %for.body30.preheader135.new

for.body30.preheader135.new:                      ; preds = %for.body30.prol.loopexit138
  br label %for.body30

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.cond35.for.end50_crit_edge.us
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %for.cond35.for.end50_crit_edge.us ], [ %indvars.iv113, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv105
  %28 = load double, double* %arrayidx34.us, align 8
  br i1 %21, label %for.body37.us.prol.loopexit.unr-lcssa, label %for.body37.us.prol.preheader

for.body37.us.prol.preheader:                     ; preds = %for.body30.us
  %29 = load double, double* %arrayidx12.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv105
  %30 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %29, %30
  %sub47.us.prol = fsub double %28, %mul46.us.prol
  br label %for.body37.us.prol.loopexit.unr-lcssa

for.body37.us.prol.loopexit.unr-lcssa:            ; preds = %for.body30.us, %for.body37.us.prol.preheader
  %indvars.iv93.unr.ph = phi i64 [ 1, %for.body37.us.prol.preheader ], [ 0, %for.body30.us ]
  %sub4729.us.unr.ph = phi double [ %sub47.us.prol, %for.body37.us.prol.preheader ], [ %28, %for.body30.us ]
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.body37.us.prol.preheader ], [ undef, %for.body30.us ]
  br i1 %22, label %for.cond35.for.end50_crit_edge.us, label %for.body37.us.preheader

for.body37.us.preheader:                          ; preds = %for.body37.us.prol.loopexit.unr-lcssa
  br label %for.body37.us

for.body37.us:                                    ; preds = %for.body37.us.preheader, %for.body37.us
  %indvars.iv93 = phi i64 [ %indvars.iv.next94.1, %for.body37.us ], [ %indvars.iv93.unr.ph, %for.body37.us.preheader ]
  %sub4729.us = phi double [ %sub47.us.1, %for.body37.us ], [ %sub4729.us.unr.ph, %for.body37.us.preheader ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv93
  %31 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv93, i64 %indvars.iv105
  %32 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %33 = load <2 x double>, <2 x double>* %31, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next94, i64 %indvars.iv105
  %34 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %32, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %34, i32 1
  %mul46.us = fmul <2 x double> %33, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %sub4729.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %indvars.iv.next94.1 = add nuw nsw i64 %indvars.iv93, 2
  %exitcond100.1 = icmp eq i64 %indvars.iv.next94.1, %indvars.iv113
  br i1 %exitcond100.1, label %for.cond35.for.end50_crit_edge.us.loopexit, label %for.body37.us

for.cond35.for.end50_crit_edge.us.loopexit:       ; preds = %for.body37.us
  br label %for.cond35.for.end50_crit_edge.us

for.cond35.for.end50_crit_edge.us:                ; preds = %for.cond35.for.end50_crit_edge.us.loopexit, %for.body37.us.prol.loopexit.unr-lcssa
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.body37.us.prol.loopexit.unr-lcssa ], [ %sub47.us.1, %for.cond35.for.end50_crit_edge.us.loopexit ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond110 = icmp eq i64 %indvars.iv.next106, 2000
  br i1 %exitcond110, label %for.inc58.loopexit, label %for.body30.us

for.body30:                                       ; preds = %for.body30, %for.body30.preheader135.new
  %indvars.iv86 = phi i64 [ %indvars.iv86.unr143, %for.body30.preheader135.new ], [ %indvars.iv.next87.3.7, %for.body30 ]
  %indvars.iv.next87.3.7 = add nsw i64 %indvars.iv86, 32
  %exitcond88.3.7 = icmp eq i64 %indvars.iv.next87.3.7, 2000
  br i1 %exitcond88.3.7, label %for.inc58.loopexit136.unr-lcssa, label %for.body30

for.inc58.loopexit:                               ; preds = %for.cond35.for.end50_crit_edge.us
  br label %for.inc58

for.inc58.loopexit136.unr-lcssa:                  ; preds = %for.body30
  br label %for.inc58.loopexit136

for.inc58.loopexit136:                            ; preds = %for.body30.prol.loopexit138, %for.inc58.loopexit136.unr-lcssa
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit136, %for.inc58.loopexit, %for.body30.prol.loopexit
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond116 = icmp eq i64 %indvars.iv.next114, 2000
  %indvars.iv.next132 = add nuw i64 %indvars.iv131, 1
  %indvars.iv.next134 = add i2 %indvars.iv133, -1
  br i1 %exitcond116, label %for.end60, label %for.body

for.end60:                                        ; preds = %for.inc58
  br i1 true, label %for.body63.preheader, label %for.end60.for.end113_crit_edge

for.end60.for.end113_crit_edge:                   ; preds = %for.end60
  br label %for.end113

for.body63.preheader:                             ; preds = %for.end60
  br label %for.body63

for.body63:                                       ; preds = %for.body63.preheader, %for.end79
  %indvars.iv = phi i2 [ 0, %for.body63.preheader ], [ %indvars.iv.next, %for.end79 ]
  %indvars.iv63 = phi i64 [ 0, %for.body63.preheader ], [ %indvars.iv.next64, %for.end79 ]
  %35 = zext i2 %indvars.iv to i64
  %36 = add nuw nsw i64 %35, 4294967295
  %37 = and i64 %36, 4294967295
  %38 = add nuw nsw i64 %37, 1
  %39 = add nuw i64 %indvars.iv63, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv63
  %40 = load double, double* %arrayidx65, align 8
  %cmp6710 = icmp sgt i64 %indvars.iv63, 0
  br i1 %cmp6710, label %for.body68.lr.ph, label %for.end79

for.body68.lr.ph:                                 ; preds = %for.body63
  %41 = trunc i64 %indvars.iv63 to i32
  %xtraiter58 = and i32 %41, 3
  %lcmp.mod59 = icmp eq i32 %xtraiter58, 0
  br i1 %lcmp.mod59, label %for.body68.prol.loopexit, label %for.body68.prol.preheader

for.body68.prol.preheader:                        ; preds = %for.body68.lr.ph
  br label %for.body68.prol

for.body68.prol:                                  ; preds = %for.body68.prol.preheader, %for.body68.prol
  %indvars.iv53.prol = phi i64 [ %indvars.iv.next54.prol, %for.body68.prol ], [ 0, %for.body68.prol.preheader ]
  %sub7612.prol = phi double [ %sub76.prol, %for.body68.prol ], [ %40, %for.body68.prol.preheader ]
  %prol.iter60 = phi i32 [ %prol.iter60.sub, %for.body68.prol ], [ %xtraiter58, %for.body68.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv63, i64 %indvars.iv53.prol
  %42 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv53.prol
  %43 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %42, %43
  %sub76.prol = fsub double %sub7612.prol, %mul75.prol
  %indvars.iv.next54.prol = add nuw nsw i64 %indvars.iv53.prol, 1
  %prol.iter60.sub = add nsw i32 %prol.iter60, -1
  %prol.iter60.cmp = icmp eq i32 %prol.iter60.sub, 0
  br i1 %prol.iter60.cmp, label %for.body68.prol.loopexit.loopexit, label %for.body68.prol, !llvm.loop !7

for.body68.prol.loopexit.loopexit:                ; preds = %for.body68.prol
  br label %for.body68.prol.loopexit

for.body68.prol.loopexit:                         ; preds = %for.body68.prol.loopexit.loopexit, %for.body68.lr.ph
  %indvars.iv53.unr = phi i64 [ 0, %for.body68.lr.ph ], [ %38, %for.body68.prol.loopexit.loopexit ]
  %sub7612.unr = phi double [ %40, %for.body68.lr.ph ], [ %sub76.prol, %for.body68.prol.loopexit.loopexit ]
  %sub76.lcssa.unr = phi double [ undef, %for.body68.lr.ph ], [ %sub76.prol, %for.body68.prol.loopexit.loopexit ]
  %44 = trunc i64 %39 to i32
  %45 = icmp ult i32 %44, 3
  br i1 %45, label %for.end79, label %for.body68.preheader

for.body68.preheader:                             ; preds = %for.body68.prol.loopexit
  br label %for.body68

for.body68:                                       ; preds = %for.body68.preheader, %for.body68
  %indvars.iv53 = phi i64 [ %indvars.iv.next54.3, %for.body68 ], [ %indvars.iv53.unr, %for.body68.preheader ]
  %sub7612 = phi double [ %sub76.3, %for.body68 ], [ %sub7612.unr, %for.body68.preheader ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv63, i64 %indvars.iv53
  %46 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv53
  %47 = bitcast double* %arrayidx74 to <2 x double>*
  %48 = load <2 x double>, <2 x double>* %46, align 8
  %49 = load <2 x double>, <2 x double>* %47, align 8
  %mul75 = fmul <2 x double> %48, %49
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %sub7612, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next54.1 = add nsw i64 %indvars.iv53, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv63, i64 %indvars.iv.next54.1
  %50 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next54.1
  %51 = bitcast double* %arrayidx74.2 to <2 x double>*
  %52 = load <2 x double>, <2 x double>* %50, align 8
  %53 = load <2 x double>, <2 x double>* %51, align 8
  %mul75.2 = fmul <2 x double> %52, %53
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %indvars.iv.next54.3 = add nsw i64 %indvars.iv53, 4
  %exitcond57.3 = icmp eq i64 %indvars.iv.next54.3, %indvars.iv63
  br i1 %exitcond57.3, label %for.end79.loopexit, label %for.body68

for.end79.loopexit:                               ; preds = %for.body68
  br label %for.end79

for.end79:                                        ; preds = %for.end79.loopexit, %for.body68.prol.loopexit, %for.body63
  %sub76.lcssa18 = phi double [ %40, %for.body63 ], [ %sub76.lcssa.unr, %for.body68.prol.loopexit ], [ %sub76.3, %for.end79.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv63
  store double %sub76.lcssa18, double* %arrayidx81, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next64, 2000
  %indvars.iv.next = add i2 %indvars.iv, 1
  br i1 %exitcond66, label %for.end84, label %for.body63

for.end84:                                        ; preds = %for.end79
  br i1 true, label %for.body88.lr.ph, label %for.end84.for.end113_crit_edge

for.end84.for.end113_crit_edge:                   ; preds = %for.end84
  br label %for.end113

for.body88.lr.ph:                                 ; preds = %for.end84
  %sunkaddr = ptrtoint double* %x to i64
  br label %for.body88

for.body88:                                       ; preds = %for.end104, %for.body88.lr.ph
  %indvars.iv129 = phi i2 [ %indvars.iv.next130, %for.end104 ], [ 0, %for.body88.lr.ph ]
  %indvars.iv127 = phi i64 [ %indvars.iv.next128, %for.end104 ], [ 2001, %for.body88.lr.ph ]
  %indvars.iv50.in = phi i64 [ %indvars.iv50, %for.end104 ], [ 2000, %for.body88.lr.ph ]
  %indvar = phi i32 [ %indvar.next, %for.end104 ], [ 0, %for.body88.lr.ph ]
  %54 = zext i2 %indvars.iv129 to i64
  %55 = add nuw nsw i64 %54, 4294967295
  %56 = and i64 %55, 4294967295
  %57 = add i64 %indvars.iv127, %56
  %indvars.iv50 = add nsw i64 %indvars.iv50.in, -1
  %58 = add nsw i32 %indvar, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv50
  %59 = load double, double* %arrayidx90, align 8
  %cmp921 = icmp slt i64 %indvars.iv50.in, 2000
  br i1 %cmp921, label %for.body93.lr.ph, label %for.end104

for.body93.lr.ph:                                 ; preds = %for.body88
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body93.prol.loopexit, label %for.body93.prol.preheader

for.body93.prol.preheader:                        ; preds = %for.body93.lr.ph
  br label %for.body93.prol

for.body93.prol:                                  ; preds = %for.body93.prol.preheader, %for.body93.prol
  %indvars.iv48.prol = phi i64 [ %indvars.iv.next49.prol, %for.body93.prol ], [ %indvars.iv50.in, %for.body93.prol.preheader ]
  %sub1013.prol = phi double [ %sub101.prol, %for.body93.prol ], [ %59, %for.body93.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body93.prol ], [ %xtraiter, %for.body93.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv50, i64 %indvars.iv48.prol
  %60 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv48.prol
  %61 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %60, %61
  %sub101.prol = fsub double %sub1013.prol, %mul100.prol
  %indvars.iv.next49.prol = add nsw i64 %indvars.iv48.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body93.prol.loopexit.loopexit, label %for.body93.prol, !llvm.loop !8

for.body93.prol.loopexit.loopexit:                ; preds = %for.body93.prol
  br label %for.body93.prol.loopexit

for.body93.prol.loopexit:                         ; preds = %for.body93.prol.loopexit.loopexit, %for.body93.lr.ph
  %indvars.iv48.unr = phi i64 [ %indvars.iv50.in, %for.body93.lr.ph ], [ %57, %for.body93.prol.loopexit.loopexit ]
  %sub1013.unr = phi double [ %59, %for.body93.lr.ph ], [ %sub101.prol, %for.body93.prol.loopexit.loopexit ]
  %sub101.lcssa.unr = phi double [ undef, %for.body93.lr.ph ], [ %sub101.prol, %for.body93.prol.loopexit.loopexit ]
  %62 = icmp ult i32 %58, 3
  br i1 %62, label %for.end104, label %for.body93.preheader

for.body93.preheader:                             ; preds = %for.body93.prol.loopexit
  br label %for.body93

for.body93:                                       ; preds = %for.body93.preheader, %for.body93
  %indvars.iv48 = phi i64 [ %indvars.iv.next49.3, %for.body93 ], [ %indvars.iv48.unr, %for.body93.preheader ]
  %sub1013 = phi double [ %sub101.3, %for.body93 ], [ %sub1013.unr, %for.body93.preheader ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv50, i64 %indvars.iv48
  %63 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv48
  %64 = bitcast double* %arrayidx99 to <2 x double>*
  %65 = load <2 x double>, <2 x double>* %63, align 8
  %66 = load <2 x double>, <2 x double>* %64, align 8
  %mul100 = fmul <2 x double> %65, %66
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %sub1013, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv50, i64 %indvars.iv.next49.1
  %67 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next49.1
  %68 = bitcast double* %arrayidx99.2 to <2 x double>*
  %69 = load <2 x double>, <2 x double>* %67, align 8
  %70 = load <2 x double>, <2 x double>* %68, align 8
  %mul100.2 = fmul <2 x double> %69, %70
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %indvars.iv.next49.3 = add nsw i64 %indvars.iv48, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next49.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, 2000
  br i1 %exitcond.3, label %for.end104.loopexit, label %for.body93

for.end104.loopexit:                              ; preds = %for.body93
  br label %for.end104

for.end104:                                       ; preds = %for.end104.loopexit, %for.body93.prol.loopexit, %for.body88
  %sub101.lcssa9 = phi double [ %59, %for.body88 ], [ %sub101.lcssa.unr, %for.body93.prol.loopexit ], [ %sub101.3, %for.end104.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv50, i64 %indvars.iv50
  %71 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %sub101.lcssa9, %71
  %sunkaddr121 = shl i64 %indvars.iv50.in, 3
  %sunkaddr122 = add i64 %sunkaddr, %sunkaddr121
  %sunkaddr123 = add i64 %sunkaddr122, -8
  %sunkaddr124 = inttoptr i64 %sunkaddr123 to double*
  store double %div109, double* %sunkaddr124, align 8
  %indvar.next = add nuw i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, 2000
  %indvars.iv.next128 = add nsw i64 %indvars.iv127, -1
  %indvars.iv.next130 = add i2 %indvars.iv129, 1
  br i1 %exitcond, label %for.end113.loopexit, label %for.body88

for.end113.loopexit:                              ; preds = %for.end104
  br label %for.end113

for.end113:                                       ; preds = %for.end113.loopexit, %for.end84.for.end113_crit_edge, %for.end60.for.end113_crit_edge, %entry
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %n, double* %x) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %if.end
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end ], [ 0, %for.body.preheader ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %if.end
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
!5 = distinct !{!5, !2}
!6 = distinct !{!6, !2}
!7 = distinct !{!7, !2}
!8 = distinct !{!8, !2}
