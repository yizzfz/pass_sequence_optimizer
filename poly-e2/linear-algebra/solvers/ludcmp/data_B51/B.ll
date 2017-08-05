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
  tail call fastcc void @kernel_ludcmp([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
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
  %1 = bitcast i8* %call2 to double*
  tail call fastcc void @print_array(double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
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

for.inc:                                          ; preds = %for.inc, %entry
  %indvars.iv123 = phi i64 [ 0, %entry ], [ %indvars.iv.next124, %for.inc ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv123
  store double 0.000000e+00, double* %arrayidx, align 8
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv123
  store double 0.000000e+00, double* %arrayidx3, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %0 = trunc i64 %indvars.iv.next124 to i32
  %conv4 = sitofp i32 %0 to double
  %div = fdiv double %conv4, 2.000000e+03
  %div5 = fmul double %div, 5.000000e-01
  %add6 = fadd double %div5, 4.000000e+00
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv123
  store double %add6, double* %arrayidx8, align 8
  %exitcond138 = icmp eq i64 %indvars.iv123, 1999
  br i1 %exitcond138, label %for.cond13.preheader.for.inc25_crit_edge.preheader, label %for.inc

for.cond13.preheader.for.inc25_crit_edge.preheader: ; preds = %for.inc
  br label %for.cond13.preheader.for.inc25_crit_edge

for.cond13.preheader.for.inc25_crit_edge:         ; preds = %for.cond13.preheader.for.inc25_crit_edge.preheader, %for.inc44.for.cond13.preheader_crit_edge
  %indvars.iv121 = phi i64 [ %indvars.iv.next122, %for.inc44.for.cond13.preheader_crit_edge ], [ 0, %for.cond13.preheader.for.inc25_crit_edge.preheader ]
  %1 = shl i64 %indvars.iv121, 32
  %sext = add i64 %1, 4294967296
  %2 = ashr exact i64 %sext, 32
  %3 = sub i64 1998, %indvars.iv121
  %4 = shl i64 %3, 3
  br label %for.inc25

for.cond29.preheader:                             ; preds = %for.inc25
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %cmp3080 = icmp slt i64 %indvars.iv.next122, 2000
  br i1 %cmp3080, label %for.inc44.for.cond13.preheader_crit_edge, label %for.end46

for.inc25:                                        ; preds = %for.inc25.for.inc25_crit_edge, %for.cond13.preheader.for.inc25_crit_edge
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %for.inc25.for.inc25_crit_edge ], [ 0, %for.cond13.preheader.for.inc25_crit_edge ]
  %5 = sub nsw i64 0, %indvars.iv105
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv121, i64 %indvars.iv105
  store double %add20, double* %arrayidx24, align 8
  %exitcond111 = icmp eq i64 %indvars.iv105, %indvars.iv121
  br i1 %exitcond111, label %for.cond29.preheader, label %for.inc25.for.inc25_crit_edge

for.inc25.for.inc25_crit_edge:                    ; preds = %for.inc25
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  br label %for.inc25

for.inc44.for.cond13.preheader_crit_edge:         ; preds = %for.cond29.preheader
  %7 = and i64 %4, 34359738360
  %scevgep119 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv121, i64 %2
  %8 = add nuw nsw i64 %7, 8
  %scevgep119120 = bitcast double* %scevgep119 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep119120, i8 0, i64 %8, i32 8, i1 false)
  %arrayidx43129 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv121, i64 %indvars.iv121
  store double 1.000000e+00, double* %arrayidx43129, align 8
  br label %for.cond13.preheader.for.inc25_crit_edge

for.end46:                                        ; preds = %for.cond29.preheader
  %arrayidx43.c = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv121, i64 %indvars.iv121
  store double 1.000000e+00, double* %arrayidx43.c, align 8
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.inc62

for.inc62:                                        ; preds = %for.inc62, %for.end46
  %indvars.iv103 = phi i64 [ 0, %for.end46 ], [ %indvars.iv.next104, %for.inc62 ]
  %9 = mul nuw nsw i64 %indvars.iv103, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %9
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond137 = icmp eq i64 %indvars.iv.next104, 2000
  br i1 %exitcond137, label %for.cond69.preheader.preheader, label %for.inc62

for.cond69.preheader.preheader:                   ; preds = %for.inc62
  br label %for.cond69.preheader

for.cond69.preheader:                             ; preds = %for.inc96, %for.cond69.preheader.preheader
  %indvars.iv97 = phi i64 [ 0, %for.cond69.preheader.preheader ], [ %indvars.iv.next98, %for.inc96 ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv97
  %10 = add i64 %indvars.iv97, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %10
  br label %for.cond73.preheader

for.cond73.preheader:                             ; preds = %for.inc93, %for.cond69.preheader
  %indvars.iv95 = phi i64 [ 0, %for.cond69.preheader ], [ %indvars.iv.next96, %for.inc93 ]
  %11 = bitcast double* %scevgep3 to i8*
  %12 = bitcast double* %scevgep5 to i8*
  %13 = mul i64 %indvars.iv95, 16000
  %scevgep1 = getelementptr i8, i8* %call, i64 %13
  %14 = add i64 %13, 16000
  %scevgep2 = getelementptr i8, i8* %call, i64 %14
  %arrayidx80 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv95, i64 %indvars.iv97
  %bound0 = icmp ult i8* %scevgep1, %12
  %bound1 = icmp ult i8* %11, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx80 to i8*
  %bc7 = bitcast double* %arrayidx80 to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc7
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %for.inc90.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader
  br label %vector.body

for.inc90.preheader:                              ; preds = %for.cond73.preheader
  br label %for.inc90

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %15 = bitcast i8* %call to [2000 x [2000 x double]]*
  %16 = or i64 %index, 1
  %17 = or i64 %index, 2
  %18 = or i64 %index, 3
  %19 = load double, double* %arrayidx80, align 8, !alias.scope !1
  %20 = insertelement <2 x double> undef, double %19, i32 0
  %21 = shufflevector <2 x double> %20, <2 x double> undef, <2 x i32> zeroinitializer
  %22 = insertelement <2 x double> undef, double %19, i32 0
  %23 = shufflevector <2 x double> %22, <2 x double> undef, <2 x i32> zeroinitializer
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv97
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %16, i64 %indvars.iv97
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %17, i64 %indvars.iv97
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %18, i64 %indvars.iv97
  %28 = load double, double* %24, align 8, !alias.scope !4
  %29 = load double, double* %25, align 8, !alias.scope !4
  %30 = load double, double* %26, align 8, !alias.scope !4
  %31 = load double, double* %27, align 8, !alias.scope !4
  %32 = insertelement <2 x double> undef, double %28, i32 0
  %33 = insertelement <2 x double> %32, double %29, i32 1
  %34 = insertelement <2 x double> undef, double %30, i32 0
  %35 = insertelement <2 x double> %34, double %31, i32 1
  %36 = fmul <2 x double> %21, %33
  %37 = fmul <2 x double> %23, %35
  %38 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %15, i64 0, i64 %indvars.iv95, i64 %index
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !6, !noalias !8
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !6, !noalias !8
  %42 = fadd <2 x double> %wide.load, %36
  %43 = fadd <2 x double> %wide.load12, %37
  %44 = bitcast double* %38 to <2 x double>*
  store <2 x double> %42, <2 x double>* %44, align 8, !alias.scope !6, !noalias !8
  %45 = bitcast double* %40 to <2 x double>*
  store <2 x double> %43, <2 x double>* %45, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %46 = icmp eq i64 %index.next, 2000
  br i1 %46, label %for.inc93.loopexit45, label %vector.body, !llvm.loop !9

for.inc90:                                        ; preds = %for.inc90.for.inc90_crit_edge, %for.inc90.preheader
  %indvars.iv91 = phi i64 [ %indvars.iv.next92, %for.inc90.for.inc90_crit_edge ], [ 0, %for.inc90.preheader ]
  %47 = bitcast i8* %call to [2000 x [2000 x double]]*
  %48 = load double, double* %arrayidx80, align 8
  %arrayidx84 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv91, i64 %indvars.iv97
  %49 = load double, double* %arrayidx84, align 8
  %mul = fmul double %48, %49
  %arrayidx88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv95, i64 %indvars.iv91
  %50 = load double, double* %arrayidx88, align 8
  %add89 = fadd double %50, %mul
  store double %add89, double* %arrayidx88, align 8
  %exitcond134 = icmp eq i64 %indvars.iv91, 1999
  br i1 %exitcond134, label %for.inc93.loopexit, label %for.inc90.for.inc90_crit_edge, !llvm.loop !12

for.inc90.for.inc90_crit_edge:                    ; preds = %for.inc90
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  br label %for.inc90

for.inc93.loopexit:                               ; preds = %for.inc90
  br label %for.inc93

for.inc93.loopexit45:                             ; preds = %vector.body
  br label %for.inc93

for.inc93:                                        ; preds = %for.inc93.loopexit45, %for.inc93.loopexit
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond135 = icmp eq i64 %indvars.iv.next96, 2000
  br i1 %exitcond135, label %for.inc96, label %for.cond73.preheader

for.inc96:                                        ; preds = %for.inc93
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond136 = icmp eq i64 %indvars.iv.next98, 2000
  br i1 %exitcond136, label %for.cond103.preheader.preheader, label %for.cond69.preheader

for.cond103.preheader.preheader:                  ; preds = %for.inc96
  br label %for.cond103.preheader

for.cond103.preheader:                            ; preds = %for.inc118, %for.cond103.preheader.preheader
  %indvars.iv89 = phi i64 [ 0, %for.cond103.preheader.preheader ], [ %indvars.iv.next90, %for.inc118 ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %51 = add i64 %indvars.iv89, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %A, i64 %51, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %52 = mul i64 %indvars.iv89, 16000
  %scevgep22 = getelementptr i8, i8* %call, i64 %52
  %53 = add i64 %52, 16000
  %scevgep23 = getelementptr i8, i8* %call, i64 %53
  %bound024 = icmp ult i8* %scevgep1819, %scevgep23
  %bound125 = icmp ult i8* %scevgep22, %scevgep2021
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %for.inc115.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %for.cond103.preheader
  br label %vector.body13

for.inc115.preheader:                             ; preds = %for.cond103.preheader
  br label %for.inc115

vector.body13:                                    ; preds = %vector.body13, %vector.body13.preheader
  %index30 = phi i64 [ 0, %vector.body13.preheader ], [ %index.next31, %vector.body13 ]
  %54 = bitcast i8* %call to [2000 x [2000 x double]]*
  %55 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv89, i64 %index30
  %56 = bitcast double* %55 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %56, align 8, !alias.scope !13
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %58, align 8, !alias.scope !13
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 %index30
  %60 = bitcast double* %59 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %60, align 8, !alias.scope !16, !noalias !13
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %62, align 8, !alias.scope !16, !noalias !13
  %index.next31 = add i64 %index30, 4
  %63 = icmp eq i64 %index.next31, 2000
  br i1 %63, label %for.inc118.loopexit44, label %vector.body13, !llvm.loop !18

for.inc115:                                       ; preds = %for.inc115.for.inc115_crit_edge, %for.inc115.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc115.for.inc115_crit_edge ], [ 0, %for.inc115.preheader ]
  %64 = bitcast i8* %call to [2000 x [2000 x double]]*
  %arrayidx110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %64, i64 0, i64 %indvars.iv89, i64 %indvars.iv
  %65 = bitcast double* %arrayidx110 to i64*
  %66 = load i64, i64* %65, align 8
  %arrayidx114 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 %indvars.iv
  %67 = bitcast double* %arrayidx114 to i64*
  store i64 %66, i64* %67, align 8
  %exitcond133 = icmp eq i64 %indvars.iv, 1999
  br i1 %exitcond133, label %for.inc118.loopexit, label %for.inc115.for.inc115_crit_edge, !llvm.loop !19

for.inc115.for.inc115_crit_edge:                  ; preds = %for.inc115
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.inc115

for.inc118.loopexit:                              ; preds = %for.inc115
  br label %for.inc118

for.inc118.loopexit44:                            ; preds = %vector.body13
  br label %for.inc118

for.inc118:                                       ; preds = %for.inc118.loopexit44, %for.inc118.loopexit
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond = icmp eq i64 %indvars.iv.next90, 2000
  br i1 %exitcond, label %for.end120, label %for.cond103.preheader

for.end120:                                       ; preds = %for.inc118
  tail call void @free(i8* %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58.for.cond1.preheader_crit_edge, %entry
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc58.for.cond1.preheader_crit_edge ], [ 0, %entry ]
  %indvars.iv145 = phi i64 [ %indvars.iv.next146, %for.inc58.for.cond1.preheader_crit_edge ], [ 4294967295, %entry ]
  %0 = and i64 %indvars.iv145, 4294967295
  %cmp296 = icmp sgt i64 %indvars.iv2, 0
  br i1 %cmp296, label %for.body3.preheader, label %for.inc58

for.body3.preheader:                              ; preds = %for.cond1.preheader
  br label %for.body3

for.body30.lr.ph:                                 ; preds = %for.inc25
  %1 = icmp sgt i64 %indvars.iv2, 0
  br i1 %1, label %for.body30.us.preheader, label %for.inc58

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.inc55.us, %for.body30.us.preheader
  %indvars.iv135 = phi i64 [ %indvars.iv2, %for.body30.us.preheader ], [ %indvars.iv.next136, %for.inc55.us ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv135
  %2 = load double, double* %arrayidx34.us, align 8
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us.for.inc48.us_crit_edge, %for.body30.us
  %indvars.iv127 = phi i64 [ %indvars.iv.next128, %for.inc48.us.for.inc48.us_crit_edge ], [ 0, %for.body30.us ]
  %w.1100.us = phi double [ %sub47.us, %for.inc48.us.for.inc48.us_crit_edge ], [ %2, %for.body30.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv127
  %3 = load double, double* %arrayidx41.us, align 8
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv127, i64 %indvars.iv135
  %4 = load double, double* %arrayidx45.us, align 8
  %mul46.us = fmul double %3, %4
  %sub47.us = fsub double %w.1100.us, %mul46.us
  %exitcond147 = icmp eq i64 %indvars.iv127, %0
  br i1 %exitcond147, label %for.inc55.us, label %for.inc48.us.for.inc48.us_crit_edge

for.inc48.us.for.inc48.us_crit_edge:              ; preds = %for.inc48.us
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  br label %for.inc48.us

for.inc55.us:                                     ; preds = %for.inc48.us
  store double %sub47.us, double* %arrayidx34.us, align 8
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next136, 2000
  br i1 %exitcond5, label %for.inc58.loopexit, label %for.body30.us

for.body3:                                        ; preds = %for.inc25.for.body3_crit_edge, %for.body3.preheader
  %indvars.iv142 = phi i64 [ %indvars.iv.next143, %for.inc25.for.body3_crit_edge ], [ 4294967295, %for.body3.preheader ]
  %indvars.iv124 = phi i64 [ %indvars.iv.next125, %for.inc25.for.body3_crit_edge ], [ 0, %for.body3.preheader ]
  %5 = and i64 %indvars.iv142, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv124
  %6 = load double, double* %arrayidx5, align 8
  %cmp792 = icmp sgt i64 %indvars.iv124, 0
  br i1 %cmp792, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.body3
  br label %for.inc

for.inc:                                          ; preds = %for.inc.for.inc_crit_edge, %for.inc.preheader
  %indvars.iv118 = phi i64 [ %indvars.iv.next119, %for.inc.for.inc_crit_edge ], [ 0, %for.inc.preheader ]
  %w.094 = phi double [ %sub, %for.inc.for.inc_crit_edge ], [ %6, %for.inc.preheader ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv118
  %7 = load double, double* %arrayidx12, align 8
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv118, i64 %indvars.iv124
  %8 = load double, double* %arrayidx16, align 8
  %mul = fmul double %7, %8
  %sub = fsub double %w.094, %mul
  %exitcond144 = icmp eq i64 %indvars.iv118, %5
  br i1 %exitcond144, label %for.inc25.loopexit, label %for.inc.for.inc_crit_edge

for.inc.for.inc_crit_edge:                        ; preds = %for.inc
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  br label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.body3
  %w.0.lcssa = phi double [ %6, %for.body3 ], [ %sub, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv124, i64 %indvars.iv124
  %9 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %9
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next125, %indvars.iv2
  br i1 %exitcond4, label %for.body30.lr.ph, label %for.inc25.for.body3_crit_edge

for.inc25.for.body3_crit_edge:                    ; preds = %for.inc25
  %indvars.iv.next143 = add nuw nsw i64 %5, 1
  br label %for.body3

for.inc58.loopexit:                               ; preds = %for.inc55.us
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit, %for.body30.lr.ph, %for.cond1.preheader
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond6, label %for.body63.preheader, label %for.inc58.for.cond1.preheader_crit_edge

for.inc58.for.cond1.preheader_crit_edge:          ; preds = %for.inc58
  %indvars.iv.next146 = add nuw nsw i64 %0, 1
  br label %for.cond1.preheader

for.body63.preheader:                             ; preds = %for.inc58
  br label %for.body63

for.body63:                                       ; preds = %for.inc82.for.body63_crit_edge, %for.body63.preheader
  %indvars.iv139 = phi i64 [ %indvars.iv.next140, %for.inc82.for.body63_crit_edge ], [ 4294967295, %for.body63.preheader ]
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %for.inc82.for.body63_crit_edge ], [ 0, %for.body63.preheader ]
  %10 = and i64 %indvars.iv139, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv116
  %11 = load double, double* %arrayidx65, align 8
  %cmp6785 = icmp sgt i64 %indvars.iv116, 0
  br i1 %cmp6785, label %for.inc77.preheader, label %for.inc82

for.inc77.preheader:                              ; preds = %for.body63
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77.for.inc77_crit_edge, %for.inc77.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc77.for.inc77_crit_edge ], [ 0, %for.inc77.preheader ]
  %w.287 = phi double [ %sub76, %for.inc77.for.inc77_crit_edge ], [ %11, %for.inc77.preheader ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv
  %12 = load double, double* %arrayidx72, align 8
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %13 = load double, double* %arrayidx74, align 8
  %mul75 = fmul double %12, %13
  %sub76 = fsub double %w.287, %mul75
  %exitcond141 = icmp eq i64 %indvars.iv, %10
  br i1 %exitcond141, label %for.inc82.loopexit, label %for.inc77.for.inc77_crit_edge

for.inc77.for.inc77_crit_edge:                    ; preds = %for.inc77
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.inc77

for.inc82.loopexit:                               ; preds = %for.inc77
  br label %for.inc82

for.inc82:                                        ; preds = %for.inc82.loopexit, %for.body63
  %w.2.lcssa = phi double [ %11, %for.body63 ], [ %sub76, %for.inc82.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv116
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next117, 2000
  br i1 %exitcond1, label %for.body88.preheader, label %for.inc82.for.body63_crit_edge

for.inc82.for.body63_crit_edge:                   ; preds = %for.inc82
  %indvars.iv.next140 = add nuw nsw i64 %10, 1
  br label %for.body63

for.body88.preheader:                             ; preds = %for.inc82
  br label %for.body88

for.body88:                                       ; preds = %for.inc112, %for.body88.preheader
  %indvars.iv110 = phi i64 [ 2000, %for.body88.preheader ], [ %indvars.iv.next111, %for.inc112 ]
  %indvars.iv.next111 = add nsw i64 %indvars.iv110, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next111
  %14 = load double, double* %arrayidx90, align 8
  %cmp9278 = icmp slt i64 %indvars.iv110, 2000
  br i1 %cmp9278, label %for.inc102.preheader, label %for.inc112

for.inc102.preheader:                             ; preds = %for.body88
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102.for.inc102_crit_edge, %for.inc102.preheader
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %for.inc102.for.inc102_crit_edge ], [ %indvars.iv110, %for.inc102.preheader ]
  %w.379 = phi double [ %sub101, %for.inc102.for.inc102_crit_edge ], [ %14, %for.inc102.preheader ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next111, i64 %indvars.iv108
  %15 = load double, double* %arrayidx97, align 8
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv108
  %16 = load double, double* %arrayidx99, align 8
  %mul100 = fmul double %15, %16
  %sub101 = fsub double %w.379, %mul100
  %exitcond = icmp eq i64 %indvars.iv108, 1999
  br i1 %exitcond, label %for.inc112.loopexit, label %for.inc102.for.inc102_crit_edge

for.inc102.for.inc102_crit_edge:                  ; preds = %for.inc102
  %indvars.iv.next109 = add i64 %indvars.iv108, 1
  br label %for.inc102

for.inc112.loopexit:                              ; preds = %for.inc102
  br label %for.inc112

for.inc112:                                       ; preds = %for.inc112.loopexit, %for.body88
  %w.3.lcssa = phi double [ %14, %for.body88 ], [ %sub101, %for.inc112.loopexit ]
  %17 = ptrtoint double* %x to i64
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next111, i64 %indvars.iv.next111
  %18 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %w.3.lcssa, %18
  %sunkaddr148 = shl i64 %indvars.iv110, 3
  %sunkaddr149 = add i64 %17, %sunkaddr148
  %sunkaddr150 = add i64 %sunkaddr149, -8
  %sunkaddr151 = inttoptr i64 %sunkaddr150 to double*
  store double %div109, double* %sunkaddr151, align 8
  %cmp87 = icmp sgt i64 %indvars.iv110, 1
  br i1 %cmp87, label %for.body88, label %for.end113

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

for.body:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

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
