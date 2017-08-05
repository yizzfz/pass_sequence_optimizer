; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  %arraydecay5 = bitcast i8* %call2 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay7 = bitcast i8* %call to [2000 x double]*
  %arraydecay8 = bitcast i8* %call1 to double*
  %arraydecay9 = bitcast i8* %call2 to double*
  %arraydecay10 = bitcast i8* %call3 to double*
  tail call fastcc void @kernel_ludcmp([2000 x double]* %arraydecay7, double* %arraydecay8, double* %arraydecay9, double* %arraydecay10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  %arraydecay12 = bitcast i8* %call2 to double*
  tail call fastcc void @print_array(double* %arraydecay12)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry:
  br label %for.inc

for.inc:                                          ; preds = %for.inc.for.inc_crit_edge, %entry
  %indvars.iv97113 = phi i64 [ 0, %entry ], [ %indvars.iv.next98.1, %for.inc.for.inc_crit_edge ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv97113
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv97113
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %2 = trunc i64 %indvars.iv97113 to i32
  %3 = or i32 %2, 1
  %conv4 = sitofp i32 %3 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv97113
  store <2 x double> zeroinitializer, <2 x double>* %0, align 8
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %indvars.iv.next98.1 = add nsw i64 %indvars.iv97113, 2
  %4 = trunc i64 %indvars.iv.next98.1 to i32
  %conv4.1 = sitofp i32 %4 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %5 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %5, align 8
  %exitcond99.1 = icmp eq i64 %indvars.iv.next98.1, 2000
  br i1 %exitcond99.1, label %for.cond13.preheader.preheader, label %for.inc.for.inc_crit_edge

for.inc.for.inc_crit_edge:                        ; preds = %for.inc
  br label %for.inc

for.cond13.preheader.preheader:                   ; preds = %for.inc
  br label %for.cond13.preheader

for.cond13.preheader:                             ; preds = %for.inc44.for.cond13.preheader_crit_edge, %for.cond13.preheader.preheader
  %indvars.iv92112 = phi i64 [ %indvars.iv.next93, %for.inc44.for.cond13.preheader_crit_edge ], [ 1, %for.cond13.preheader.preheader ]
  %indvars.iv94111 = phi i64 [ %indvars.iv.next95, %for.inc44.for.cond13.preheader_crit_edge ], [ 0, %for.cond13.preheader.preheader ]
  %6 = mul nuw nsw i64 %indvars.iv94111, 2001
  %7 = add nuw nsw i64 %6, 1
  %scevgep115 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %7
  br label %for.inc25

for.cond29.preheader:                             ; preds = %for.inc25
  %exitcond91109 = icmp eq i64 %indvars.iv94111, 1999
  br i1 %exitcond91109, label %for.inc44.thread, label %for.inc44

for.inc44.thread:                                 ; preds = %for.cond29.preheader
  %arrayidx43119 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv94111, i64 %indvars.iv94111
  store double 1.000000e+00, double* %arrayidx43119, align 8
  br label %for.end46

for.inc25:                                        ; preds = %for.inc25.for.inc25_crit_edge, %for.cond13.preheader
  %indvars.iv81107 = phi i64 [ 0, %for.cond13.preheader ], [ %indvars.iv.next82, %for.inc25.for.inc25_crit_edge ]
  %8 = sub nsw i64 0, %indvars.iv81107
  %9 = trunc i64 %8 to i32
  %rem = srem i32 %9, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv94111, i64 %indvars.iv81107
  store double %add20, double* %arrayidx24, align 8
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81107, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next82, %indvars.iv92112
  br i1 %exitcond86, label %for.cond29.preheader, label %for.inc25.for.inc25_crit_edge

for.inc25.for.inc25_crit_edge:                    ; preds = %for.inc25
  br label %for.inc25

for.inc44:                                        ; preds = %for.cond29.preheader
  %10 = mul nsw i64 %indvars.iv94111, -8
  %11 = add nsw i64 %10, 15992
  %scevgep115116 = bitcast double* %scevgep115 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep115116, i8 0, i64 %11, i32 8, i1 false)
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv94111, i64 %indvars.iv94111
  store double 1.000000e+00, double* %arrayidx43, align 8
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94111, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next95, 2000
  br i1 %exitcond96, label %for.end46.loopexit, label %for.inc44.for.cond13.preheader_crit_edge

for.inc44.for.cond13.preheader_crit_edge:         ; preds = %for.inc44
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92112, 1
  br label %for.cond13.preheader

for.end46.loopexit:                               ; preds = %for.inc44
  br label %for.end46

for.end46:                                        ; preds = %for.end46.loopexit, %for.inc44.thread
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.inc62

for.inc62:                                        ; preds = %for.inc62.for.inc62_crit_edge, %for.end46
  %indvars.iv78106 = phi i64 [ 0, %for.end46 ], [ %indvars.iv.next79.7, %for.inc62.for.inc62_crit_edge ]
  %12 = mul nuw nsw i64 %indvars.iv78106, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %12
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next79 = or i64 %indvars.iv78106, 1
  %13 = mul nuw nsw i64 %indvars.iv.next79, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next79.1 = or i64 %indvars.iv78106, 2
  %14 = mul nuw nsw i64 %indvars.iv.next79.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next79.2 = or i64 %indvars.iv78106, 3
  %15 = mul nuw nsw i64 %indvars.iv.next79.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next79.3 = or i64 %indvars.iv78106, 4
  %16 = mul nuw nsw i64 %indvars.iv.next79.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next79.4 = or i64 %indvars.iv78106, 5
  %17 = mul nuw nsw i64 %indvars.iv.next79.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next79.5 = or i64 %indvars.iv78106, 6
  %18 = mul nuw nsw i64 %indvars.iv.next79.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next79.6 = or i64 %indvars.iv78106, 7
  %19 = mul nuw nsw i64 %indvars.iv.next79.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next79.7 = add nsw i64 %indvars.iv78106, 8
  %exitcond80.7 = icmp eq i64 %indvars.iv.next79.7, 2000
  br i1 %exitcond80.7, label %for.inc62.for.cond69.preheader_crit_edge, label %for.inc62.for.inc62_crit_edge

for.inc62.for.inc62_crit_edge:                    ; preds = %for.inc62
  br label %for.inc62

for.inc62.for.cond69.preheader_crit_edge:         ; preds = %for.inc62
  %20 = bitcast i8* %call to [2000 x [2000 x double]]*
  %21 = bitcast i8* %call to [2000 x [2000 x double]]*
  %22 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond69.preheader

for.cond69.preheader:                             ; preds = %for.inc96.for.cond69.preheader_crit_edge, %for.inc62.for.cond69.preheader_crit_edge
  %indvars.iv72104 = phi i64 [ 0, %for.inc62.for.cond69.preheader_crit_edge ], [ %indvars.iv.next73, %for.inc96.for.cond69.preheader_crit_edge ]
  %scevgep4 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv72104
  %23 = add i64 %indvars.iv72104, 1
  %scevgep6 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %23
  %24 = bitcast double* %scevgep6 to i8*
  %25 = bitcast double* %scevgep4 to i8*
  br label %for.cond73.preheader

for.cond73.preheader:                             ; preds = %for.inc93.for.cond73.preheader_crit_edge, %for.cond69.preheader
  %indvars.iv69103 = phi i64 [ 0, %for.cond69.preheader ], [ %indvars.iv.next70, %for.inc93.for.cond73.preheader_crit_edge ]
  %26 = mul i64 %indvars.iv69103, 16000
  %scevgep2 = getelementptr i8, i8* %call, i64 %26
  %27 = add i64 %26, 16000
  %scevgep3 = getelementptr i8, i8* %call, i64 %27
  %arrayidx80 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv69103, i64 %indvars.iv72104
  %bound0 = icmp ult i8* %scevgep2, %24
  %bound1 = icmp ult i8* %25, %scevgep3
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx80 to i8*
  %bc8 = bitcast double* %arrayidx80 to i8*
  %bound09 = icmp ult i8* %scevgep2, %bc8
  %bound110 = icmp ult i8* %bc, %scevgep3
  %found.conflict11 = and i1 %bound09, %bound110
  %conflict.rdx = or i1 %found.conflict, %found.conflict11
  br i1 %conflict.rdx, label %for.inc90.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader
  br label %vector.body

for.inc90.preheader:                              ; preds = %for.cond73.preheader
  br label %for.inc90

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %28 = or i64 %index, 1
  %29 = or i64 %index, 2
  %30 = or i64 %index, 3
  %31 = load double, double* %arrayidx80, align 8, !alias.scope !1
  %32 = insertelement <2 x double> undef, double %31, i32 0
  %33 = shufflevector <2 x double> %32, <2 x double> undef, <2 x i32> zeroinitializer
  %34 = insertelement <2 x double> undef, double %31, i32 0
  %35 = shufflevector <2 x double> %34, <2 x double> undef, <2 x i32> zeroinitializer
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv72104
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %28, i64 %indvars.iv72104
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %29, i64 %indvars.iv72104
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %30, i64 %indvars.iv72104
  %40 = load double, double* %36, align 8, !alias.scope !4
  %41 = load double, double* %37, align 8, !alias.scope !4
  %42 = load double, double* %38, align 8, !alias.scope !4
  %43 = load double, double* %39, align 8, !alias.scope !4
  %44 = insertelement <2 x double> undef, double %40, i32 0
  %45 = insertelement <2 x double> %44, double %41, i32 1
  %46 = insertelement <2 x double> undef, double %42, i32 0
  %47 = insertelement <2 x double> %46, double %43, i32 1
  %48 = fmul <2 x double> %33, %45
  %49 = fmul <2 x double> %35, %47
  %50 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv69103, i64 %index
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !6, !noalias !8
  %52 = getelementptr double, double* %50, i64 2
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !6, !noalias !8
  %54 = fadd <2 x double> %wide.load, %48
  %55 = fadd <2 x double> %wide.load13, %49
  %56 = bitcast double* %50 to <2 x double>*
  store <2 x double> %54, <2 x double>* %56, align 8, !alias.scope !6, !noalias !8
  %57 = bitcast double* %52 to <2 x double>*
  store <2 x double> %55, <2 x double>* %57, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %58 = icmp eq i64 %index.next, 2000
  br i1 %58, label %for.inc93.loopexit46, label %vector.body.vector.body_crit_edge, !llvm.loop !9

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

for.inc90:                                        ; preds = %for.inc90.for.inc90_crit_edge, %for.inc90.preheader
  %indvars.iv66102 = phi i64 [ 0, %for.inc90.preheader ], [ %indvars.iv.next67.1, %for.inc90.for.inc90_crit_edge ]
  %59 = load double, double* %arrayidx80, align 8
  %arrayidx84 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66102, i64 %indvars.iv72104
  %60 = load double, double* %arrayidx84, align 8
  %mul = fmul double %59, %60
  %arrayidx88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv69103, i64 %indvars.iv66102
  %61 = load double, double* %arrayidx88, align 8
  %add89 = fadd double %61, %mul
  store double %add89, double* %arrayidx88, align 8
  %indvars.iv.next67 = or i64 %indvars.iv66102, 1
  %62 = load double, double* %arrayidx80, align 8
  %arrayidx84.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next67, i64 %indvars.iv72104
  %63 = load double, double* %arrayidx84.1, align 8
  %mul.1 = fmul double %62, %63
  %arrayidx88.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv69103, i64 %indvars.iv.next67
  %64 = load double, double* %arrayidx88.1, align 8
  %add89.1 = fadd double %64, %mul.1
  store double %add89.1, double* %arrayidx88.1, align 8
  %indvars.iv.next67.1 = add nsw i64 %indvars.iv66102, 2
  %exitcond68.1 = icmp eq i64 %indvars.iv.next67.1, 2000
  br i1 %exitcond68.1, label %for.inc93.loopexit, label %for.inc90.for.inc90_crit_edge, !llvm.loop !12

for.inc90.for.inc90_crit_edge:                    ; preds = %for.inc90
  br label %for.inc90

for.inc93.loopexit:                               ; preds = %for.inc90
  br label %for.inc93

for.inc93.loopexit46:                             ; preds = %vector.body
  br label %for.inc93

for.inc93:                                        ; preds = %for.inc93.loopexit46, %for.inc93.loopexit
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69103, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next70, 2000
  br i1 %exitcond71, label %for.inc96, label %for.inc93.for.cond73.preheader_crit_edge

for.inc93.for.cond73.preheader_crit_edge:         ; preds = %for.inc93
  br label %for.cond73.preheader

for.inc96:                                        ; preds = %for.inc93
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72104, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next73, 2000
  br i1 %exitcond74, label %for.cond103.preheader.preheader, label %for.inc96.for.cond69.preheader_crit_edge

for.inc96.for.cond69.preheader_crit_edge:         ; preds = %for.inc96
  br label %for.cond69.preheader

for.cond103.preheader.preheader:                  ; preds = %for.inc96
  %65 = bitcast i8* %call to [2000 x [2000 x double]]*
  %66 = bitcast i8* %call to [2000 x [2000 x double]]*
  %67 = bitcast i8* %call to [2000 x [2000 x double]]*
  %68 = bitcast i8* %call to [2000 x [2000 x double]]*
  %69 = bitcast i8* %call to [2000 x [2000 x double]]*
  %70 = bitcast i8* %call to [2000 x [2000 x double]]*
  %71 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond103.preheader

for.cond103.preheader:                            ; preds = %for.inc118.for.cond103.preheader_crit_edge, %for.cond103.preheader.preheader
  %indvars.iv63101 = phi i64 [ %indvars.iv.next64, %for.inc118.for.cond103.preheader_crit_edge ], [ 0, %for.cond103.preheader.preheader ]
  %scevgep19 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv63101, i64 0
  %scevgep1920 = bitcast double* %scevgep19 to i8*
  %72 = add i64 %indvars.iv63101, 1
  %scevgep21 = getelementptr [2000 x double], [2000 x double]* %A, i64 %72, i64 0
  %scevgep2122 = bitcast double* %scevgep21 to i8*
  %73 = mul i64 %indvars.iv63101, 16000
  %scevgep23 = getelementptr i8, i8* %call, i64 %73
  %74 = add i64 %73, 16000
  %scevgep24 = getelementptr i8, i8* %call, i64 %74
  %bound025 = icmp ult i8* %scevgep1920, %scevgep24
  %bound126 = icmp ult i8* %scevgep23, %scevgep2122
  %memcheck.conflict28 = and i1 %bound025, %bound126
  br i1 %memcheck.conflict28, label %for.inc115.preheader, label %vector.body14.preheader

vector.body14.preheader:                          ; preds = %for.cond103.preheader
  br label %vector.body14

for.inc115.preheader:                             ; preds = %for.cond103.preheader
  br label %for.inc115

vector.body14:                                    ; preds = %vector.body14.vector.body14_crit_edge, %vector.body14.preheader
  %index31 = phi i64 [ 0, %vector.body14.preheader ], [ %index.next32.1, %vector.body14.vector.body14_crit_edge ]
  %75 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %70, i64 0, i64 %indvars.iv63101, i64 %index31
  %76 = bitcast double* %75 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %76, align 8, !alias.scope !13
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x i64>*
  %wide.load40 = load <2 x i64>, <2 x i64>* %78, align 8, !alias.scope !13
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv63101, i64 %index31
  %80 = bitcast double* %79 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %80, align 8, !alias.scope !16, !noalias !13
  %81 = getelementptr double, double* %79, i64 2
  %82 = bitcast double* %81 to <2 x i64>*
  store <2 x i64> %wide.load40, <2 x i64>* %82, align 8, !alias.scope !16, !noalias !13
  %index.next32 = or i64 %index31, 4
  %83 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %71, i64 0, i64 %indvars.iv63101, i64 %index.next32
  %84 = bitcast double* %83 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %84, align 8, !alias.scope !13
  %85 = getelementptr double, double* %83, i64 2
  %86 = bitcast double* %85 to <2 x i64>*
  %wide.load40.1 = load <2 x i64>, <2 x i64>* %86, align 8, !alias.scope !13
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv63101, i64 %index.next32
  %88 = bitcast double* %87 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %88, align 8, !alias.scope !16, !noalias !13
  %89 = getelementptr double, double* %87, i64 2
  %90 = bitcast double* %89 to <2 x i64>*
  store <2 x i64> %wide.load40.1, <2 x i64>* %90, align 8, !alias.scope !16, !noalias !13
  %index.next32.1 = add nsw i64 %index31, 8
  %91 = icmp eq i64 %index.next32.1, 2000
  br i1 %91, label %for.inc118.loopexit45, label %vector.body14.vector.body14_crit_edge, !llvm.loop !18

vector.body14.vector.body14_crit_edge:            ; preds = %vector.body14
  br label %vector.body14

for.inc115:                                       ; preds = %for.inc115.for.inc115_crit_edge, %for.inc115.preheader
  %indvars.iv100 = phi i64 [ 0, %for.inc115.preheader ], [ %indvars.iv.next.4, %for.inc115.for.inc115_crit_edge ]
  %arrayidx110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %65, i64 0, i64 %indvars.iv63101, i64 %indvars.iv100
  %92 = bitcast double* %arrayidx110 to i64*
  %93 = load i64, i64* %92, align 8
  %arrayidx114 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv63101, i64 %indvars.iv100
  %94 = bitcast double* %arrayidx114 to i64*
  store i64 %93, i64* %94, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv100, 1
  %arrayidx110.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %66, i64 0, i64 %indvars.iv63101, i64 %indvars.iv.next
  %95 = bitcast double* %arrayidx110.1 to i64*
  %96 = load i64, i64* %95, align 8
  %arrayidx114.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv63101, i64 %indvars.iv.next
  %97 = bitcast double* %arrayidx114.1 to i64*
  store i64 %96, i64* %97, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv100, 2
  %arrayidx110.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %indvars.iv63101, i64 %indvars.iv.next.1
  %98 = bitcast double* %arrayidx110.2 to i64*
  %99 = load i64, i64* %98, align 8
  %arrayidx114.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv63101, i64 %indvars.iv.next.1
  %100 = bitcast double* %arrayidx114.2 to i64*
  store i64 %99, i64* %100, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv100, 3
  %arrayidx110.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv63101, i64 %indvars.iv.next.2
  %101 = bitcast double* %arrayidx110.3 to i64*
  %102 = load i64, i64* %101, align 8
  %arrayidx114.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv63101, i64 %indvars.iv.next.2
  %103 = bitcast double* %arrayidx114.3 to i64*
  store i64 %102, i64* %103, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv100, 4
  %arrayidx110.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv63101, i64 %indvars.iv.next.3
  %104 = bitcast double* %arrayidx110.4 to i64*
  %105 = load i64, i64* %104, align 8
  %arrayidx114.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv63101, i64 %indvars.iv.next.3
  %106 = bitcast double* %arrayidx114.4 to i64*
  store i64 %105, i64* %106, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv100, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %for.inc118.loopexit, label %for.inc115.for.inc115_crit_edge, !llvm.loop !19

for.inc115.for.inc115_crit_edge:                  ; preds = %for.inc115
  br label %for.inc115

for.inc118.loopexit:                              ; preds = %for.inc115
  br label %for.inc118

for.inc118.loopexit45:                            ; preds = %vector.body14
  br label %for.inc118

for.inc118:                                       ; preds = %for.inc118.loopexit45, %for.inc118.loopexit
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63101, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next64, 2000
  br i1 %exitcond65, label %for.end120, label %for.inc118.for.cond103.preheader_crit_edge

for.inc118.for.cond103.preheader_crit_edge:       ; preds = %for.inc118
  br label %for.cond103.preheader

for.end120:                                       ; preds = %for.inc118
  tail call void @free(i8* nonnull %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58.for.cond1.preheader_crit_edge, %entry
  %indvars.iv110136 = phi i64 [ 0, %entry ], [ %indvars.iv.next111, %for.inc58.for.cond1.preheader_crit_edge ]
  %exitcond99128 = icmp eq i64 %indvars.iv110136, 0
  br i1 %exitcond99128, label %for.cond1.preheader.vector.body.preheader_crit_edge, label %for.body3.preheader

for.cond1.preheader.vector.body.preheader_crit_edge: ; preds = %for.cond1.preheader
  br label %vector.body.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110136, i64 0
  br label %for.body3

vector.body.preheader:                            ; preds = %for.body30.lr.ph.vector.body.preheader_crit_edge, %for.cond1.preheader.vector.body.preheader_crit_edge
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.3, %vector.body.vector.body_crit_edge ]
  %0 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110136, i64 %index
  %1 = bitcast double* %0 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %1, align 8
  %2 = getelementptr double, double* %0, i64 2
  %3 = bitcast double* %2 to <2 x i64>*
  %wide.load2 = load <2 x i64>, <2 x i64>* %3, align 8
  %4 = bitcast double* %0 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %4, align 8
  %5 = bitcast double* %2 to <2 x i64>*
  store <2 x i64> %wide.load2, <2 x i64>* %5, align 8
  %index.next = or i64 %index, 4
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110136, i64 %index.next
  %7 = bitcast double* %6 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %7, align 8
  %8 = getelementptr double, double* %6, i64 2
  %9 = bitcast double* %8 to <2 x i64>*
  %wide.load2.1 = load <2 x i64>, <2 x i64>* %9, align 8
  %10 = bitcast double* %6 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %10, align 8
  %11 = bitcast double* %8 to <2 x i64>*
  store <2 x i64> %wide.load2.1, <2 x i64>* %11, align 8
  %index.next.1 = or i64 %index, 8
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110136, i64 %index.next.1
  %13 = bitcast double* %12 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %13, align 8
  %14 = getelementptr double, double* %12, i64 2
  %15 = bitcast double* %14 to <2 x i64>*
  %wide.load2.2 = load <2 x i64>, <2 x i64>* %15, align 8
  %16 = bitcast double* %12 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %16, align 8
  %17 = bitcast double* %14 to <2 x i64>*
  store <2 x i64> %wide.load2.2, <2 x i64>* %17, align 8
  %index.next.2 = or i64 %index, 12
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110136, i64 %index.next.2
  %19 = bitcast double* %18 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %19, align 8
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x i64>*
  %wide.load2.3 = load <2 x i64>, <2 x i64>* %21, align 8
  %22 = bitcast double* %18 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %22, align 8
  %23 = bitcast double* %20 to <2 x i64>*
  store <2 x i64> %wide.load2.3, <2 x i64>* %23, align 8
  %index.next.3 = add nsw i64 %index, 16
  %24 = icmp eq i64 %index.next.3, 2000
  br i1 %24, label %for.inc58.loopexit, label %vector.body.vector.body_crit_edge, !llvm.loop !20

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

for.body30.lr.ph:                                 ; preds = %for.inc25
  %exitcond104130 = icmp eq i64 %indvars.iv110136, 0
  br i1 %exitcond104130, label %for.body30.lr.ph.vector.body.preheader_crit_edge, label %for.body30.us.preheader

for.body30.lr.ph.vector.body.preheader_crit_edge: ; preds = %for.body30.lr.ph
  br label %vector.body.preheader

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %xtraiter9 = and i64 %indvars.iv110136, 1
  %lcmp.mod10 = icmp eq i64 %xtraiter9, 0
  %25 = icmp eq i64 %indvars.iv110136, 1
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110136, i64 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.inc55.us.for.body30.us_crit_edge, %for.body30.us.preheader
  %indvars.iv107135.us = phi i64 [ %indvars.iv.next108.us, %for.inc55.us.for.body30.us_crit_edge ], [ %indvars.iv110136, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110136, i64 %indvars.iv107135.us
  %26 = load double, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod10, label %for.body30.us.for.inc48.us.prol.loopexit_crit_edge, label %for.inc48.us.prol

for.body30.us.for.inc48.us.prol.loopexit_crit_edge: ; preds = %for.body30.us
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol:                                ; preds = %for.body30.us
  %27 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv107135.us
  %28 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %27, %28
  %sub47.us.prol = fsub double %26, %mul46.us.prol
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.body30.us.for.inc48.us.prol.loopexit_crit_edge, %for.inc48.us.prol
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ undef, %for.body30.us.for.inc48.us.prol.loopexit_crit_edge ]
  %w.1132.us.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %26, %for.body30.us.for.inc48.us.prol.loopexit_crit_edge ]
  %indvars.iv100131.us.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us.for.inc48.us.prol.loopexit_crit_edge ]
  br i1 %25, label %for.inc48.us.prol.loopexit.for.inc55.us_crit_edge, label %for.body30.us.new

for.inc48.us.prol.loopexit.for.inc55.us_crit_edge: ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc55.us

for.body30.us.new:                                ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us.for.inc48.us_crit_edge, %for.body30.us.new
  %w.1132.us = phi double [ %w.1132.us.unr.ph, %for.body30.us.new ], [ %sub47.us.1, %for.inc48.us.for.inc48.us_crit_edge ]
  %indvars.iv100131.us = phi i64 [ %indvars.iv100131.us.unr.ph, %for.body30.us.new ], [ %indvars.iv.next101.us.1, %for.inc48.us.for.inc48.us_crit_edge ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110136, i64 %indvars.iv100131.us
  %29 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv100131.us, i64 %indvars.iv107135.us
  %30 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next101.us = add nuw nsw i64 %indvars.iv100131.us, 1
  %31 = load <2 x double>, <2 x double>* %29, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next101.us, i64 %indvars.iv107135.us
  %32 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %30, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %32, i32 1
  %mul46.us = fmul <2 x double> %31, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %w.1132.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %indvars.iv.next101.us.1 = add nsw i64 %indvars.iv100131.us, 2
  %exitcond104.us.1 = icmp eq i64 %indvars.iv.next101.us.1, %indvars.iv110136
  br i1 %exitcond104.us.1, label %for.inc55.us.loopexit, label %for.inc48.us.for.inc48.us_crit_edge

for.inc48.us.for.inc48.us_crit_edge:              ; preds = %for.inc48.us
  br label %for.inc48.us

for.inc55.us.loopexit:                            ; preds = %for.inc48.us
  br label %for.inc55.us

for.inc55.us:                                     ; preds = %for.inc48.us.prol.loopexit.for.inc55.us_crit_edge, %for.inc55.us.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.inc48.us.prol.loopexit.for.inc55.us_crit_edge ], [ %sub47.us.1, %for.inc55.us.loopexit ]
  %arrayidx54.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110136, i64 %indvars.iv107135.us
  store double %sub47.us.lcssa, double* %arrayidx54.us, align 8
  %indvars.iv.next108.us = add nuw nsw i64 %indvars.iv107135.us, 1
  %exitcond109.us = icmp eq i64 %indvars.iv.next108.us, 2000
  br i1 %exitcond109.us, label %for.inc58.loopexit11, label %for.inc55.us.for.body30.us_crit_edge

for.inc55.us.for.body30.us_crit_edge:             ; preds = %for.inc55.us
  br label %for.body30.us

for.body3:                                        ; preds = %for.inc25.for.body3_crit_edge, %for.body3.preheader
  %indvars.iv94129 = phi i64 [ %indvars.iv.next95, %for.inc25.for.body3_crit_edge ], [ 0, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110136, i64 %indvars.iv94129
  %33 = load double, double* %arrayidx5, align 8
  %exitcond93124 = icmp eq i64 %indvars.iv94129, 0
  br i1 %exitcond93124, label %for.body3.for.inc25_crit_edge, label %for.inc.preheader

for.body3.for.inc25_crit_edge:                    ; preds = %for.body3
  br label %for.inc25

for.inc.preheader:                                ; preds = %for.body3
  %xtraiter7 = and i64 %indvars.iv94129, 1
  %lcmp.mod8 = icmp eq i64 %xtraiter7, 0
  br i1 %lcmp.mod8, label %for.inc.preheader.for.inc.prol.loopexit_crit_edge, label %for.inc.prol

for.inc.preheader.for.inc.prol.loopexit_crit_edge: ; preds = %for.inc.preheader
  br label %for.inc.prol.loopexit

for.inc.prol:                                     ; preds = %for.inc.preheader
  %34 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv94129
  %35 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %34, %35
  %sub.prol = fsub double %33, %mul.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.preheader.for.inc.prol.loopexit_crit_edge, %for.inc.prol
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader.for.inc.prol.loopexit_crit_edge ]
  %w.0126.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %33, %for.inc.preheader.for.inc.prol.loopexit_crit_edge ]
  %indvars.iv89125.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader.for.inc.prol.loopexit_crit_edge ]
  %36 = icmp eq i64 %indvars.iv94129, 1
  br i1 %36, label %for.inc.prol.loopexit.for.inc25_crit_edge, label %for.inc.preheader.new

for.inc.prol.loopexit.for.inc25_crit_edge:        ; preds = %for.inc.prol.loopexit
  br label %for.inc25

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.for.inc_crit_edge, %for.inc.preheader.new
  %w.0126 = phi double [ %w.0126.unr.ph, %for.inc.preheader.new ], [ %sub.1, %for.inc.for.inc_crit_edge ]
  %indvars.iv89125 = phi i64 [ %indvars.iv89125.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next90.1, %for.inc.for.inc_crit_edge ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110136, i64 %indvars.iv89125
  %37 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89125, i64 %indvars.iv94129
  %38 = load double, double* %arrayidx16, align 8
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89125, 1
  %39 = load <2 x double>, <2 x double>* %37, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next90, i64 %indvars.iv94129
  %40 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %38, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %40, i32 1
  %mul = fmul <2 x double> %39, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %w.0126, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %indvars.iv.next90.1 = add nsw i64 %indvars.iv89125, 2
  %exitcond93.1 = icmp eq i64 %indvars.iv.next90.1, %indvars.iv94129
  br i1 %exitcond93.1, label %for.inc25.loopexit, label %for.inc.for.inc_crit_edge

for.inc.for.inc_crit_edge:                        ; preds = %for.inc
  br label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc.prol.loopexit.for.inc25_crit_edge, %for.body3.for.inc25_crit_edge, %for.inc25.loopexit
  %w.0.lcssa = phi double [ %33, %for.body3.for.inc25_crit_edge ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit.for.inc25_crit_edge ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv94129, i64 %indvars.iv94129
  %41 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %41
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110136, i64 %indvars.iv94129
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94129, 1
  %exitcond99 = icmp eq i64 %indvars.iv.next95, %indvars.iv110136
  br i1 %exitcond99, label %for.body30.lr.ph, label %for.inc25.for.body3_crit_edge

for.inc25.for.body3_crit_edge:                    ; preds = %for.inc25
  br label %for.body3

for.inc58.loopexit:                               ; preds = %vector.body
  br label %for.inc58

for.inc58.loopexit11:                             ; preds = %for.inc55.us
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit11, %for.inc58.loopexit
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110136, 1
  %exitcond112 = icmp eq i64 %indvars.iv.next111, 2000
  br i1 %exitcond112, label %for.body63.preheader, label %for.inc58.for.cond1.preheader_crit_edge

for.inc58.for.cond1.preheader_crit_edge:          ; preds = %for.inc58
  br label %for.cond1.preheader

for.body63.preheader:                             ; preds = %for.inc58
  br label %for.body63

for.body63:                                       ; preds = %for.body63.backedge, %for.body63.preheader
  %indvars.iv86123 = phi i64 [ 0, %for.body63.preheader ], [ %indvars.iv86123.be, %for.body63.backedge ]
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv86123
  %42 = load double, double* %arrayidx65, align 8
  %exitcond85119 = icmp eq i64 %indvars.iv86123, 0
  br i1 %exitcond85119, label %for.inc82.thread, label %for.inc77.preheader

for.inc77.preheader:                              ; preds = %for.body63
  %43 = add i64 %indvars.iv86123, -1
  %xtraiter4 = and i64 %indvars.iv86123, 3
  %lcmp.mod5 = icmp eq i64 %xtraiter4, 0
  br i1 %lcmp.mod5, label %for.inc77.preheader.for.inc77.prol.loopexit_crit_edge, label %for.inc77.prol.preheader

for.inc77.preheader.for.inc77.prol.loopexit_crit_edge: ; preds = %for.inc77.preheader
  br label %for.inc77.prol.loopexit

for.inc77.prol.preheader:                         ; preds = %for.inc77.preheader
  br label %for.inc77.prol

for.inc77.prol:                                   ; preds = %for.inc77.prol.for.inc77.prol_crit_edge, %for.inc77.prol.preheader
  %w.2121.prol = phi double [ %sub76.prol, %for.inc77.prol.for.inc77.prol_crit_edge ], [ %42, %for.inc77.prol.preheader ]
  %indvars.iv81120.prol = phi i64 [ %indvars.iv.next82.prol, %for.inc77.prol.for.inc77.prol_crit_edge ], [ 0, %for.inc77.prol.preheader ]
  %prol.iter6 = phi i64 [ %prol.iter6.sub, %for.inc77.prol.for.inc77.prol_crit_edge ], [ %xtraiter4, %for.inc77.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv86123, i64 %indvars.iv81120.prol
  %44 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv81120.prol
  %45 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %44, %45
  %sub76.prol = fsub double %w.2121.prol, %mul75.prol
  %indvars.iv.next82.prol = add nuw nsw i64 %indvars.iv81120.prol, 1
  %prol.iter6.sub = add i64 %prol.iter6, -1
  %prol.iter6.cmp = icmp eq i64 %prol.iter6.sub, 0
  br i1 %prol.iter6.cmp, label %for.inc77.prol.loopexit.loopexit, label %for.inc77.prol.for.inc77.prol_crit_edge, !llvm.loop !21

for.inc77.prol.for.inc77.prol_crit_edge:          ; preds = %for.inc77.prol
  br label %for.inc77.prol

for.inc77.prol.loopexit.loopexit:                 ; preds = %for.inc77.prol
  br label %for.inc77.prol.loopexit

for.inc77.prol.loopexit:                          ; preds = %for.inc77.preheader.for.inc77.prol.loopexit_crit_edge, %for.inc77.prol.loopexit.loopexit
  %sub76.lcssa.unr = phi double [ undef, %for.inc77.preheader.for.inc77.prol.loopexit_crit_edge ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %w.2121.unr = phi double [ %42, %for.inc77.preheader.for.inc77.prol.loopexit_crit_edge ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %indvars.iv81120.unr = phi i64 [ 0, %for.inc77.preheader.for.inc77.prol.loopexit_crit_edge ], [ %indvars.iv.next82.prol, %for.inc77.prol.loopexit.loopexit ]
  %46 = icmp ult i64 %43, 3
  br i1 %46, label %for.inc77.prol.loopexit.for.inc82_crit_edge, label %for.inc77.preheader.new

for.inc77.prol.loopexit.for.inc82_crit_edge:      ; preds = %for.inc77.prol.loopexit
  br label %for.inc82

for.inc77.preheader.new:                          ; preds = %for.inc77.prol.loopexit
  br label %for.inc77

for.inc82.thread:                                 ; preds = %for.body63
  %arrayidx81140 = getelementptr inbounds double, double* %y, i64 %indvars.iv86123
  store double %42, double* %arrayidx81140, align 8
  br label %for.body63.backedge

for.body63.backedge:                              ; preds = %for.inc82.for.body63.backedge_crit_edge, %for.inc82.thread
  %indvars.iv86123.be = phi i64 [ 1, %for.inc82.thread ], [ %indvars.iv.next87, %for.inc82.for.body63.backedge_crit_edge ]
  br label %for.body63

for.inc77:                                        ; preds = %for.inc77.for.inc77_crit_edge, %for.inc77.preheader.new
  %w.2121 = phi double [ %w.2121.unr, %for.inc77.preheader.new ], [ %sub76.3, %for.inc77.for.inc77_crit_edge ]
  %indvars.iv81120 = phi i64 [ %indvars.iv81120.unr, %for.inc77.preheader.new ], [ %indvars.iv.next82.3, %for.inc77.for.inc77_crit_edge ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv86123, i64 %indvars.iv81120
  %47 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv81120
  %48 = bitcast double* %arrayidx74 to <2 x double>*
  %49 = load <2 x double>, <2 x double>* %47, align 8
  %50 = load <2 x double>, <2 x double>* %48, align 8
  %mul75 = fmul <2 x double> %49, %50
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %w.2121, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next82.1 = add nsw i64 %indvars.iv81120, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv86123, i64 %indvars.iv.next82.1
  %51 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next82.1
  %52 = bitcast double* %arrayidx74.2 to <2 x double>*
  %53 = load <2 x double>, <2 x double>* %51, align 8
  %54 = load <2 x double>, <2 x double>* %52, align 8
  %mul75.2 = fmul <2 x double> %53, %54
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %indvars.iv.next82.3 = add nsw i64 %indvars.iv81120, 4
  %exitcond85.3 = icmp eq i64 %indvars.iv.next82.3, %indvars.iv86123
  br i1 %exitcond85.3, label %for.inc82.loopexit, label %for.inc77.for.inc77_crit_edge

for.inc77.for.inc77_crit_edge:                    ; preds = %for.inc77
  br label %for.inc77

for.inc82.loopexit:                               ; preds = %for.inc77
  br label %for.inc82

for.inc82:                                        ; preds = %for.inc77.prol.loopexit.for.inc82_crit_edge, %for.inc82.loopexit
  %sub76.lcssa = phi double [ %sub76.lcssa.unr, %for.inc77.prol.loopexit.for.inc82_crit_edge ], [ %sub76.3, %for.inc82.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv86123
  store double %sub76.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86123, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next87, 2000
  br i1 %exitcond88, label %for.body88.preheader, label %for.inc82.for.body63.backedge_crit_edge

for.inc82.for.body63.backedge_crit_edge:          ; preds = %for.inc82
  br label %for.body63.backedge

for.body88.preheader:                             ; preds = %for.inc82
  br label %for.body88

for.body88:                                       ; preds = %for.body88.preheader, %for.inc112.for.body88_crit_edge
  %indvar = phi i64 [ 0, %for.body88.preheader ], [ %indvar.next, %for.inc112.for.body88_crit_edge ]
  %indvars.iv.next80118 = phi i64 [ 1999, %for.body88.preheader ], [ %indvars.iv.next80, %for.inc112.for.body88_crit_edge ]
  %55 = add i64 %indvar, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next80118
  %56 = load double, double* %arrayidx90, align 8
  %exitcond114 = icmp eq i64 %indvars.iv.next80118, 1999
  br i1 %exitcond114, label %for.inc112.thread, label %for.inc102.preheader

for.inc102.preheader:                             ; preds = %for.body88
  %xtraiter = and i64 %indvar, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc102.preheader.for.inc102.prol.loopexit_crit_edge, label %for.inc102.prol.preheader

for.inc102.preheader.for.inc102.prol.loopexit_crit_edge: ; preds = %for.inc102.preheader
  br label %for.inc102.prol.loopexit

for.inc102.prol.preheader:                        ; preds = %for.inc102.preheader
  br label %for.inc102.prol

for.inc102.prol:                                  ; preds = %for.inc102.prol.for.inc102.prol_crit_edge, %for.inc102.prol.preheader
  %indvars.iv.next78116.in.prol = phi i64 [ %indvars.iv.next78116.prol, %for.inc102.prol.for.inc102.prol_crit_edge ], [ %indvars.iv.next80118, %for.inc102.prol.preheader ]
  %w.3115.prol = phi double [ %sub101.prol, %for.inc102.prol.for.inc102.prol_crit_edge ], [ %56, %for.inc102.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc102.prol.for.inc102.prol_crit_edge ], [ %xtraiter, %for.inc102.prol.preheader ]
  %indvars.iv.next78116.prol = add nsw i64 %indvars.iv.next78116.in.prol, 1
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next80118, i64 %indvars.iv.next78116.prol
  %57 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv.next78116.prol
  %58 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %57, %58
  %sub101.prol = fsub double %w.3115.prol, %mul100.prol
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc102.prol.loopexit.loopexit, label %for.inc102.prol.for.inc102.prol_crit_edge, !llvm.loop !23

for.inc102.prol.for.inc102.prol_crit_edge:        ; preds = %for.inc102.prol
  br label %for.inc102.prol

for.inc102.prol.loopexit.loopexit:                ; preds = %for.inc102.prol
  br label %for.inc102.prol.loopexit

for.inc102.prol.loopexit:                         ; preds = %for.inc102.preheader.for.inc102.prol.loopexit_crit_edge, %for.inc102.prol.loopexit.loopexit
  %sub101.lcssa.unr = phi double [ undef, %for.inc102.preheader.for.inc102.prol.loopexit_crit_edge ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %indvars.iv.next78116.in.unr = phi i64 [ %indvars.iv.next80118, %for.inc102.preheader.for.inc102.prol.loopexit_crit_edge ], [ %indvars.iv.next78116.prol, %for.inc102.prol.loopexit.loopexit ]
  %w.3115.unr = phi double [ %56, %for.inc102.preheader.for.inc102.prol.loopexit_crit_edge ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %59 = icmp ult i64 %55, 3
  br i1 %59, label %for.inc102.prol.loopexit.for.inc112_crit_edge, label %for.inc102.preheader.new

for.inc102.prol.loopexit.for.inc112_crit_edge:    ; preds = %for.inc102.prol.loopexit
  br label %for.inc112

for.inc102.preheader.new:                         ; preds = %for.inc102.prol.loopexit
  br label %for.inc102

for.inc112.thread:                                ; preds = %for.body88
  %arrayidx108144 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next80118, i64 %indvars.iv.next80118
  %60 = load double, double* %arrayidx108144, align 8
  %div109145 = fdiv double %56, %60
  %arrayidx111146 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next80118
  store double %div109145, double* %arrayidx111146, align 8
  br label %for.inc112.for.body88_crit_edge

for.inc102:                                       ; preds = %for.inc102.for.inc102_crit_edge, %for.inc102.preheader.new
  %indvars.iv.next78116.in = phi i64 [ %indvars.iv.next78116.in.unr, %for.inc102.preheader.new ], [ %indvars.iv.next78116.3, %for.inc102.for.inc102_crit_edge ]
  %w.3115 = phi double [ %w.3115.unr, %for.inc102.preheader.new ], [ %sub101.3, %for.inc102.for.inc102_crit_edge ]
  %indvars.iv.next78116 = add nsw i64 %indvars.iv.next78116.in, 1
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next80118, i64 %indvars.iv.next78116
  %61 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next78116
  %62 = bitcast double* %arrayidx99 to <2 x double>*
  %63 = load <2 x double>, <2 x double>* %61, align 8
  %64 = load <2 x double>, <2 x double>* %62, align 8
  %mul100 = fmul <2 x double> %63, %64
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %w.3115, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next78116.2 = add nsw i64 %indvars.iv.next78116.in, 3
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next80118, i64 %indvars.iv.next78116.2
  %65 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next78116.2
  %66 = bitcast double* %arrayidx99.2 to <2 x double>*
  %indvars.iv.next78116.3 = add nsw i64 %indvars.iv.next78116.in, 4
  %67 = load <2 x double>, <2 x double>* %65, align 8
  %68 = load <2 x double>, <2 x double>* %66, align 8
  %mul100.2 = fmul <2 x double> %67, %68
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %exitcond.3 = icmp eq i64 %indvars.iv.next78116.3, 1999
  br i1 %exitcond.3, label %for.inc112.loopexit, label %for.inc102.for.inc102_crit_edge

for.inc102.for.inc102_crit_edge:                  ; preds = %for.inc102
  br label %for.inc102

for.inc112.loopexit:                              ; preds = %for.inc102
  br label %for.inc112

for.inc112:                                       ; preds = %for.inc102.prol.loopexit.for.inc112_crit_edge, %for.inc112.loopexit
  %sub101.lcssa = phi double [ %sub101.lcssa.unr, %for.inc102.prol.loopexit.for.inc112_crit_edge ], [ %sub101.3, %for.inc112.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next80118, i64 %indvars.iv.next80118
  %69 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %sub101.lcssa, %69
  %arrayidx111 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next80118
  store double %div109, double* %arrayidx111, align 8
  %cmp87 = icmp sgt i64 %indvars.iv.next80118, 0
  br i1 %cmp87, label %for.inc112.for.inc112.for.body88_crit_edge_crit_edge, label %for.end113

for.inc112.for.inc112.for.body88_crit_edge_crit_edge: ; preds = %for.inc112
  br label %for.inc112.for.body88_crit_edge

for.inc112.for.body88_crit_edge:                  ; preds = %for.inc112.for.inc112.for.body88_crit_edge_crit_edge, %for.inc112.thread
  %indvars.iv.next80 = add nsw i64 %indvars.iv.next80118, -1
  %indvar.next = add i64 %indvar, 1
  br label %for.body88

for.end113:                                       ; preds = %for.inc112
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %x) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %for.inc.for.body_crit_edge, %entry
  %indvars.iv4 = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc.for.body_crit_edge ]
  %3 = trunc i64 %indvars.iv4 to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.body.for.inc_crit_edge

for.body.for.inc_crit_edge:                       ; preds = %for.body
  br label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body.for.inc_crit_edge, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv4
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.inc.for.body_crit_edge

for.inc.for.body_crit_edge:                       ; preds = %for.inc
  br label %for.body

for.end:                                          ; preds = %for.inc
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!5, !2}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}
!20 = distinct !{!20, !10, !11}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.unroll.disable"}
!23 = distinct !{!23, !22}
