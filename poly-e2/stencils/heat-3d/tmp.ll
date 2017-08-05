; ModuleID = 'B.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %arraydecay = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay2 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @init_array([120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_heat_3d([120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
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
  tail call fastcc void @print_array([120 x [120 x double]]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc22, %entry
  %indvars.iv22 = phi i64 [ 0, %entry ], [ %indvars.iv.next23, %for.inc22 ]
  %0 = add nuw nsw i64 %indvars.iv22, 120
  %1 = trunc i64 %0 to i32
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc19, %for.cond1.preheader
  %indvars.iv20 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next21, %for.inc19 ]
  %2 = trunc i64 %indvars.iv20 to i32
  %add = add i32 %1, %2
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.cond4.preheader
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next.1, %for.body6 ]
  %3 = trunc i64 %indvars.iv to i32
  %add7 = sub nuw nsw i32 %add, %3
  %conv = sitofp i32 %add7 to double
  %mul = fmul double %conv, 1.000000e+01
  %div = fdiv double %mul, 1.200000e+02
  %arrayidx12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv22, i64 %indvars.iv20, i64 %indvars.iv
  store double %div, double* %arrayidx12, align 8
  %arrayidx18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv22, i64 %indvars.iv20, i64 %indvars.iv
  store double %div, double* %arrayidx18, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %4 = trunc i64 %indvars.iv.next to i32
  %add7.1 = sub nuw nsw i32 %add, %4
  %conv.1 = sitofp i32 %add7.1 to double
  %mul.1 = fmul double %conv.1, 1.000000e+01
  %div.1 = fdiv double %mul.1, 1.200000e+02
  %arrayidx12.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv22, i64 %indvars.iv20, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx12.1, align 8
  %arrayidx18.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv22, i64 %indvars.iv20, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx18.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 119
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.inc19, label %for.body6

for.inc19:                                        ; preds = %for.body6
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next21, 120
  br i1 %exitcond1, label %for.inc22, label %for.cond4.preheader

for.inc22:                                        ; preds = %for.inc19
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next23, 120
  br i1 %exitcond2, label %for.end24, label %for.cond1.preheader

for.end24:                                        ; preds = %for.inc22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc209, %entry
  %t.0108 = phi i32 [ 1, %entry ], [ %inc210, %for.inc209 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc98, %for.cond1.preheader
  %indvar21 = phi i64 [ %indvar.next22, %for.inc98 ], [ 0, %for.cond1.preheader ]
  %indvars.iv113 = phi i64 [ %indvars.iv.next114, %for.inc98 ], [ 1, %for.cond1.preheader ]
  %0 = add nuw nsw i64 %indvar21, 1
  %1 = add nuw nsw i64 %indvar21, 2
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %2 = add nsw i64 %indvars.iv113, -1
  br label %for.cond8.preheader

for.cond8.preheader:                              ; preds = %for.inc95, %for.cond4.preheader
  %indvar23 = phi i64 [ %indvar.next24, %for.inc95 ], [ 0, %for.cond4.preheader ]
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %for.inc95 ], [ 1, %for.cond4.preheader ]
  %3 = add nuw nsw i64 %indvar23, 1
  %scevgep25 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %0, i64 %3, i64 1
  %scevgep27 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %0, i64 %3, i64 119
  %scevgep29 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvar21, i64 %3, i64 1
  %scevgep31 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %1, i64 %3, i64 119
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %4 = add nsw i64 %indvars.iv110, -1
  %bound033 = icmp ult double* %scevgep25, %scevgep31
  %bound134 = icmp ult double* %scevgep29, %scevgep27
  %memcheck.conflict36 = and i1 %bound033, %bound134
  br i1 %memcheck.conflict36, label %for.body11.preheader, label %vector.body16.preheader

vector.body16.preheader:                          ; preds = %for.cond8.preheader
  br label %vector.body16

for.body11.preheader:                             ; preds = %for.cond8.preheader
  br label %for.body11

vector.body16:                                    ; preds = %vector.body16, %vector.body16.preheader
  %index39 = phi i64 [ %index.next40, %vector.body16 ], [ 0, %vector.body16.preheader ]
  %offset.idx43 = or i64 %index39, 1
  %5 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv.next114, i64 %indvars.iv110, i64 %offset.idx43
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !1
  %7 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv113, i64 %indvars.iv110, i64 %offset.idx43
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1
  %9 = fmul <2 x double> %wide.load48, <double 2.000000e+00, double 2.000000e+00>
  %10 = fsub <2 x double> %wide.load47, %9
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %2, i64 %indvars.iv110, i64 %offset.idx43
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = fadd <2 x double> %wide.load49, %10
  %14 = fmul <2 x double> %13, <double 1.250000e-01, double 1.250000e-01>
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv113, i64 %indvars.iv.next111, i64 %offset.idx43
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = fsub <2 x double> %wide.load50, %9
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv113, i64 %4, i64 %offset.idx43
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = fadd <2 x double> %17, %wide.load51
  %21 = fmul <2 x double> %20, <double 1.250000e-01, double 1.250000e-01>
  %22 = fadd <2 x double> %14, %21
  %23 = add nuw nsw i64 %offset.idx43, 1
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv113, i64 %indvars.iv110, i64 %23
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = fsub <2 x double> %wide.load52, %9
  %27 = add nsw i64 %offset.idx43, -1
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv113, i64 %indvars.iv110, i64 %27
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = fadd <2 x double> %26, %wide.load53
  %31 = fmul <2 x double> %30, <double 1.250000e-01, double 1.250000e-01>
  %32 = fadd <2 x double> %22, %31
  %33 = fadd <2 x double> %wide.load48, %32
  %34 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv113, i64 %indvars.iv110, i64 %offset.idx43
  %35 = bitcast double* %34 to <2 x double>*
  store <2 x double> %33, <2 x double>* %35, align 8, !alias.scope !4, !noalias !1
  %index.next40 = add nuw nsw i64 %index39, 2
  %36 = icmp eq i64 %index.next40, 118
  br i1 %36, label %for.inc95.loopexit60, label %vector.body16, !llvm.loop !6

for.body11:                                       ; preds = %for.body11, %for.body11.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body11 ], [ 1, %for.body11.preheader ]
  %arrayidx15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv.next114, i64 %indvars.iv110, i64 %indvars.iv
  %37 = load double, double* %arrayidx15, align 8
  %arrayidx21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv113, i64 %indvars.iv110, i64 %indvars.iv
  %38 = load double, double* %arrayidx21, align 8
  %mul = fmul double %38, 2.000000e+00
  %sub22 = fsub double %37, %mul
  %arrayidx29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %2, i64 %indvars.iv110, i64 %indvars.iv
  %39 = load double, double* %arrayidx29, align 8
  %add30 = fadd double %39, %sub22
  %mul31 = fmul double %add30, 1.250000e-01
  %arrayidx38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv113, i64 %indvars.iv.next111, i64 %indvars.iv
  %40 = load double, double* %arrayidx38, align 8
  %sub46 = fsub double %40, %mul
  %arrayidx53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv113, i64 %4, i64 %indvars.iv
  %41 = load double, double* %arrayidx53, align 8
  %add54 = fadd double %sub46, %41
  %mul55 = fmul double %add54, 1.250000e-01
  %add56 = fadd double %mul31, %mul55
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv113, i64 %indvars.iv110, i64 %indvars.iv.next
  %42 = load double, double* %arrayidx63, align 8
  %sub71 = fsub double %42, %mul
  %43 = add nsw i64 %indvars.iv, -1
  %arrayidx78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv113, i64 %indvars.iv110, i64 %43
  %44 = load double, double* %arrayidx78, align 8
  %add79 = fadd double %sub71, %44
  %mul80 = fmul double %add79, 1.250000e-01
  %add81 = fadd double %add56, %mul80
  %add88 = fadd double %38, %add81
  %arrayidx94 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv113, i64 %indvars.iv110, i64 %indvars.iv
  store double %add88, double* %arrayidx94, align 8
  %exitcond = icmp eq i64 %indvars.iv, 118
  br i1 %exitcond, label %for.inc95.loopexit, label %for.body11, !llvm.loop !9

for.inc95.loopexit:                               ; preds = %for.body11
  br label %for.inc95

for.inc95.loopexit60:                             ; preds = %vector.body16
  br label %for.inc95

for.inc95:                                        ; preds = %for.inc95.loopexit60, %for.inc95.loopexit
  %indvar.next24 = add nuw nsw i64 %indvar23, 1
  %exitcond54 = icmp eq i64 %indvar.next24, 118
  br i1 %exitcond54, label %for.inc98, label %for.cond8.preheader

for.inc98:                                        ; preds = %for.inc95
  %indvar.next22 = add nuw nsw i64 %indvar21, 1
  %exitcond55 = icmp eq i64 %indvar.next22, 118
  br i1 %exitcond55, label %for.cond105.preheader.preheader, label %for.cond4.preheader

for.cond105.preheader.preheader:                  ; preds = %for.inc98
  br label %for.cond105.preheader

for.cond105.preheader:                            ; preds = %for.inc206, %for.cond105.preheader.preheader
  %indvar = phi i64 [ %indvar.next, %for.inc206 ], [ 0, %for.cond105.preheader.preheader ]
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %for.inc206 ], [ 1, %for.cond105.preheader.preheader ]
  %45 = add nuw nsw i64 %indvar, 1
  %46 = add nuw nsw i64 %indvar, 2
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %47 = add nsw i64 %indvars.iv123, -1
  br label %for.cond109.preheader

for.cond109.preheader:                            ; preds = %for.inc203, %for.cond105.preheader
  %indvar1 = phi i64 [ %indvar.next2, %for.inc203 ], [ 0, %for.cond105.preheader ]
  %indvars.iv120 = phi i64 [ %indvars.iv.next121, %for.inc203 ], [ 1, %for.cond105.preheader ]
  %48 = add nuw nsw i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %45, i64 %48, i64 1
  %scevgep4 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %45, i64 %48, i64 119
  %scevgep6 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvar, i64 %48, i64 1
  %scevgep8 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %46, i64 %48, i64 119
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %49 = add nsw i64 %indvars.iv120, -1
  %bound0 = icmp ult double* %scevgep, %scevgep8
  %bound1 = icmp ult double* %scevgep6, %scevgep4
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body112.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond109.preheader
  br label %vector.body

for.body112.preheader:                            ; preds = %for.cond109.preheader
  br label %for.body112

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv.next124, i64 %indvars.iv120, i64 %offset.idx
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !10
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv123, i64 %indvars.iv120, i64 %offset.idx
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load10 = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !10
  %54 = fmul <2 x double> %wide.load10, <double 2.000000e+00, double 2.000000e+00>
  %55 = fsub <2 x double> %wide.load, %54
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %47, i64 %indvars.iv120, i64 %offset.idx
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !10
  %58 = fadd <2 x double> %wide.load11, %55
  %59 = fmul <2 x double> %58, <double 1.250000e-01, double 1.250000e-01>
  %60 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv123, i64 %indvars.iv.next121, i64 %offset.idx
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !10
  %62 = fsub <2 x double> %wide.load12, %54
  %63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv123, i64 %49, i64 %offset.idx
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !10
  %65 = fadd <2 x double> %62, %wide.load13
  %66 = fmul <2 x double> %65, <double 1.250000e-01, double 1.250000e-01>
  %67 = fadd <2 x double> %59, %66
  %68 = add nuw nsw i64 %offset.idx, 1
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv123, i64 %indvars.iv120, i64 %68
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !10
  %71 = fsub <2 x double> %wide.load14, %54
  %72 = add nsw i64 %offset.idx, -1
  %73 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv123, i64 %indvars.iv120, i64 %72
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !10
  %75 = fadd <2 x double> %71, %wide.load15
  %76 = fmul <2 x double> %75, <double 1.250000e-01, double 1.250000e-01>
  %77 = fadd <2 x double> %67, %76
  %78 = fadd <2 x double> %wide.load10, %77
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv123, i64 %indvars.iv120, i64 %offset.idx
  %80 = bitcast double* %79 to <2 x double>*
  store <2 x double> %78, <2 x double>* %80, align 8, !alias.scope !13, !noalias !10
  %index.next = add nuw nsw i64 %index, 2
  %81 = icmp eq i64 %index.next, 118
  br i1 %81, label %for.inc203.loopexit59, label %vector.body, !llvm.loop !15

for.body112:                                      ; preds = %for.body112, %for.body112.preheader
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %for.body112 ], [ 1, %for.body112.preheader ]
  %arrayidx119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv.next124, i64 %indvars.iv120, i64 %indvars.iv116
  %82 = load double, double* %arrayidx119, align 8
  %arrayidx125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv123, i64 %indvars.iv120, i64 %indvars.iv116
  %83 = load double, double* %arrayidx125, align 8
  %mul126 = fmul double %83, 2.000000e+00
  %sub127 = fsub double %82, %mul126
  %arrayidx134 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %47, i64 %indvars.iv120, i64 %indvars.iv116
  %84 = load double, double* %arrayidx134, align 8
  %add135 = fadd double %84, %sub127
  %mul136 = fmul double %add135, 1.250000e-01
  %arrayidx143 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv123, i64 %indvars.iv.next121, i64 %indvars.iv116
  %85 = load double, double* %arrayidx143, align 8
  %sub151 = fsub double %85, %mul126
  %arrayidx158 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv123, i64 %49, i64 %indvars.iv116
  %86 = load double, double* %arrayidx158, align 8
  %add159 = fadd double %sub151, %86
  %mul160 = fmul double %add159, 1.250000e-01
  %add161 = fadd double %mul136, %mul160
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %arrayidx168 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv123, i64 %indvars.iv120, i64 %indvars.iv.next117
  %87 = load double, double* %arrayidx168, align 8
  %sub176 = fsub double %87, %mul126
  %88 = add nsw i64 %indvars.iv116, -1
  %arrayidx183 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv123, i64 %indvars.iv120, i64 %88
  %89 = load double, double* %arrayidx183, align 8
  %add184 = fadd double %sub176, %89
  %mul185 = fmul double %add184, 1.250000e-01
  %add186 = fadd double %add161, %mul185
  %add193 = fadd double %83, %add186
  %arrayidx199 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv123, i64 %indvars.iv120, i64 %indvars.iv116
  store double %add193, double* %arrayidx199, align 8
  %exitcond119 = icmp eq i64 %indvars.iv116, 118
  br i1 %exitcond119, label %for.inc203.loopexit, label %for.body112, !llvm.loop !16

for.inc203.loopexit:                              ; preds = %for.body112
  br label %for.inc203

for.inc203.loopexit59:                            ; preds = %vector.body
  br label %for.inc203

for.inc203:                                       ; preds = %for.inc203.loopexit59, %for.inc203.loopexit
  %indvar.next2 = add nuw nsw i64 %indvar1, 1
  %exitcond56 = icmp eq i64 %indvar.next2, 118
  br i1 %exitcond56, label %for.inc206, label %for.cond109.preheader

for.inc206:                                       ; preds = %for.inc203
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond57 = icmp eq i64 %indvar.next, 118
  br i1 %exitcond57, label %for.inc209, label %for.cond105.preheader

for.inc209:                                       ; preds = %for.inc206
  %inc210 = add nuw nsw i32 %t.0108, 1
  %exitcond58 = icmp eq i32 %inc210, 501
  br i1 %exitcond58, label %for.end211, label %for.cond1.preheader

for.end211:                                       ; preds = %for.inc209
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([120 x [120 x double]]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc21, %entry
  %indvars.iv22 = phi i64 [ 0, %entry ], [ %indvars.iv.next23, %for.inc21 ]
  %3 = mul nuw nsw i64 %indvars.iv22, 120
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc18, %for.cond2.preheader
  %indvars.iv20 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next21, %for.inc18 ]
  %mul815 = add nuw nsw i64 %indvars.iv20, %3
  %sext = mul nuw nsw i64 %mul815, 515396075520
  %4 = lshr exact i64 %sext, 32
  br label %for.body7

for.body7:                                        ; preds = %if.end, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %if.end ]
  %5 = add nuw nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %for.body7
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv22, i64 %indvars.iv20, i64 %indvars.iv
  %9 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %for.inc18, label %for.body7

for.inc18:                                        ; preds = %if.end
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next21, 120
  br i1 %exitcond1, label %for.inc21, label %for.cond5.preheader

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next23, 120
  br i1 %exitcond2, label %for.end23, label %for.cond2.preheader

for.end23:                                        ; preds = %for.inc21
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
