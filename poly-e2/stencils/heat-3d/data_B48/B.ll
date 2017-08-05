; ModuleID = 'A.ll'
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
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
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
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc22, %entry
  %indvars.iv24 = phi i64 [ 0, %entry ], [ %indvars.iv.next25, %for.inc22 ]
  %0 = trunc i64 %indvars.iv24 to i32
  %sub = add i32 %0, 120
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc19, %for.cond1.preheader
  %indvars.iv21 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next22, %for.inc19 ]
  %1 = trunc i64 %indvars.iv21 to i32
  %add = add i32 %sub, %1
  br label %for.inc

for.inc:                                          ; preds = %for.cond4.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc ], [ 0, %for.cond4.preheader ]
  %2 = trunc i64 %indvars.iv to i32
  %add7 = sub i32 %add, %2
  %conv = sitofp i32 %add7 to double
  %mul = fmul double %conv, 1.000000e+01
  %div = fdiv double %mul, 1.200000e+02
  %arrayidx12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv24, i64 %indvars.iv21, i64 %indvars.iv
  store double %div, double* %arrayidx12, align 8
  %arrayidx18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv24, i64 %indvars.iv21, i64 %indvars.iv
  store double %div, double* %arrayidx18, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %3 = trunc i64 %indvars.iv.next to i32
  %add7.1 = sub i32 %add, %3
  %conv.1 = sitofp i32 %add7.1 to double
  %mul.1 = fmul double %conv.1, 1.000000e+01
  %div.1 = fdiv double %mul.1, 1.200000e+02
  %arrayidx12.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv24, i64 %indvars.iv21, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx12.1, align 8
  %arrayidx18.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv24, i64 %indvars.iv21, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx18.1, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %for.inc19, label %for.inc

for.inc19:                                        ; preds = %for.inc
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond = icmp eq i64 %indvars.iv.next22, 120
  br i1 %exitcond, label %for.inc22, label %for.cond4.preheader

for.inc22:                                        ; preds = %for.inc19
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, 120
  br i1 %exitcond27, label %for.end24, label %for.cond1.preheader

for.end24:                                        ; preds = %for.inc22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32 %tsteps, i32 %n, [120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc209, %entry
  %storemerge113 = phi i32 [ 1, %entry ], [ %inc210, %for.inc209 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.cond1.preheader, %for.inc98
  %indvars.iv122 = phi i64 [ %0, %for.inc98 ], [ 1, %for.cond1.preheader ]
  %0 = add nuw nsw i64 %indvars.iv122, 1
  %1 = add nsw i64 %indvars.iv122, -1
  br label %for.cond8.preheader.us

for.cond8.preheader.us:                           ; preds = %for.cond4.preheader, %for.inc95.us
  %indvar165 = phi i64 [ 0, %for.cond4.preheader ], [ %indvar.next166, %for.inc95.us ]
  %indvars.iv117 = phi i64 [ 1, %for.cond4.preheader ], [ %indvars.iv.next118, %for.inc95.us ]
  %2 = add nuw nsw i64 %indvar165, 1
  %scevgep167 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv122, i64 %2, i64 1
  %scevgep169 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv122, i64 %2, i64 119
  %3 = add nuw nsw i64 %indvar165, -118
  %scevgep171 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv122, i64 %3, i64 -119
  %scevgep173 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %0, i64 %2, i64 119
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %4 = add nsw i64 %indvars.iv117, -1
  %bound0175 = icmp ult double* %scevgep167, %scevgep173
  %bound1176 = icmp ult double* %scevgep171, %scevgep169
  %memcheck.conflict178 = and i1 %bound0175, %bound1176
  br i1 %memcheck.conflict178, label %for.inc.us.preheader, label %vector.body160.preheader

vector.body160.preheader:                         ; preds = %for.cond8.preheader.us
  br label %vector.body160

for.inc.us.preheader:                             ; preds = %for.cond8.preheader.us
  br label %for.inc.us

vector.body160:                                   ; preds = %vector.body160.preheader, %vector.body160
  %index181 = phi i64 [ %index.next182, %vector.body160 ], [ 0, %vector.body160.preheader ]
  %offset.idx185 = or i64 %index181, 1
  %5 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %0, i64 %indvars.iv117, i64 %offset.idx185
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load189 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !1
  %7 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv122, i64 %indvars.iv117, i64 %offset.idx185
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load190 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1
  %9 = fmul <2 x double> %wide.load190, <double 2.000000e+00, double 2.000000e+00>
  %10 = fsub <2 x double> %wide.load189, %9
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %1, i64 %indvars.iv117, i64 %offset.idx185
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load191 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = fadd <2 x double> %wide.load191, %10
  %14 = fmul <2 x double> %13, <double 1.250000e-01, double 1.250000e-01>
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv122, i64 %indvars.iv.next118, i64 %offset.idx185
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load192 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = fsub <2 x double> %wide.load192, %9
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv122, i64 %4, i64 %offset.idx185
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load193 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = fadd <2 x double> %wide.load193, %17
  %21 = fmul <2 x double> %20, <double 1.250000e-01, double 1.250000e-01>
  %22 = fadd <2 x double> %14, %21
  %23 = add nuw nsw i64 %offset.idx185, 1
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv122, i64 %indvars.iv117, i64 %23
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load194 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = fsub <2 x double> %wide.load194, %9
  %27 = add nsw i64 %offset.idx185, -1
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv122, i64 %indvars.iv117, i64 %27
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load195 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = fadd <2 x double> %wide.load195, %26
  %31 = fmul <2 x double> %30, <double 1.250000e-01, double 1.250000e-01>
  %32 = fadd <2 x double> %22, %31
  %33 = fadd <2 x double> %wide.load190, %32
  %34 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv122, i64 %indvars.iv117, i64 %offset.idx185
  %35 = bitcast double* %34 to <2 x double>*
  store <2 x double> %33, <2 x double>* %35, align 8, !alias.scope !4, !noalias !1
  %index.next182 = add nuw nsw i64 %index181, 2
  %36 = icmp eq i64 %index.next182, 118
  br i1 %36, label %for.inc95.us.loopexit197, label %vector.body160, !llvm.loop !6

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us ], [ 1, %for.inc.us.preheader ]
  %arrayidx15.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %0, i64 %indvars.iv117, i64 %indvars.iv
  %37 = load double, double* %arrayidx15.us, align 8
  %arrayidx21.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv122, i64 %indvars.iv117, i64 %indvars.iv
  %38 = load double, double* %arrayidx21.us, align 8
  %mul.us = fmul double %38, 2.000000e+00
  %sub22.us = fsub double %37, %mul.us
  %arrayidx29.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %1, i64 %indvars.iv117, i64 %indvars.iv
  %39 = load double, double* %arrayidx29.us, align 8
  %add30.us = fadd double %39, %sub22.us
  %mul31.us = fmul double %add30.us, 1.250000e-01
  %arrayidx38.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv122, i64 %indvars.iv.next118, i64 %indvars.iv
  %40 = load double, double* %arrayidx38.us, align 8
  %sub46.us = fsub double %40, %mul.us
  %arrayidx53.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv122, i64 %4, i64 %indvars.iv
  %41 = load double, double* %arrayidx53.us, align 8
  %add54.us = fadd double %41, %sub46.us
  %mul55.us = fmul double %add54.us, 1.250000e-01
  %add56.us = fadd double %mul31.us, %mul55.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv122, i64 %indvars.iv117, i64 %indvars.iv.next
  %42 = load double, double* %arrayidx63.us, align 8
  %sub71.us = fsub double %42, %mul.us
  %43 = add nsw i64 %indvars.iv, -1
  %arrayidx78.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv122, i64 %indvars.iv117, i64 %43
  %44 = load double, double* %arrayidx78.us, align 8
  %add79.us = fadd double %44, %sub71.us
  %mul80.us = fmul double %add79.us, 1.250000e-01
  %add81.us = fadd double %add56.us, %mul80.us
  %add88.us = fadd double %38, %add81.us
  %arrayidx94.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv122, i64 %indvars.iv117, i64 %indvars.iv
  store double %add88.us, double* %arrayidx94.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %for.inc95.us.loopexit, label %for.inc.us, !llvm.loop !9

for.inc95.us.loopexit:                            ; preds = %for.inc.us
  br label %for.inc95.us

for.inc95.us.loopexit197:                         ; preds = %vector.body160
  br label %for.inc95.us

for.inc95.us:                                     ; preds = %for.inc95.us.loopexit197, %for.inc95.us.loopexit
  %exitcond121 = icmp eq i64 %indvars.iv.next118, 119
  %indvar.next166 = add nuw nsw i64 %indvar165, 1
  br i1 %exitcond121, label %for.inc98, label %for.cond8.preheader.us

for.inc98:                                        ; preds = %for.inc95.us
  %exitcond127 = icmp eq i64 %0, 119
  br i1 %exitcond127, label %for.cond105.preheader.preheader, label %for.cond4.preheader

for.cond105.preheader.preheader:                  ; preds = %for.inc98
  br label %for.cond105.preheader

for.cond105.preheader:                            ; preds = %for.cond105.preheader.preheader, %for.inc206
  %indvars.iv139 = phi i64 [ %45, %for.inc206 ], [ 1, %for.cond105.preheader.preheader ]
  %45 = add nuw nsw i64 %indvars.iv139, 1
  %46 = add nsw i64 %indvars.iv139, -1
  br label %for.cond109.preheader.us

for.cond109.preheader.us:                         ; preds = %for.cond105.preheader, %for.inc203.us
  %indvar = phi i64 [ 0, %for.cond105.preheader ], [ %indvar.next, %for.inc203.us ]
  %indvars.iv134 = phi i64 [ 1, %for.cond105.preheader ], [ %indvars.iv.next135, %for.inc203.us ]
  %47 = add nuw nsw i64 %indvar, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv139, i64 %47, i64 1
  %scevgep148 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv139, i64 %47, i64 119
  %48 = add nuw nsw i64 %indvar, -118
  %scevgep150 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv139, i64 %48, i64 -119
  %scevgep152 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %45, i64 %47, i64 119
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %49 = add nsw i64 %indvars.iv134, -1
  %bound0 = icmp ult double* %scevgep, %scevgep152
  %bound1 = icmp ult double* %scevgep150, %scevgep148
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.inc200.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond109.preheader.us
  br label %vector.body

for.inc200.us.preheader:                          ; preds = %for.cond109.preheader.us
  br label %for.inc200.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %45, i64 %indvars.iv134, i64 %offset.idx
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !10
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv139, i64 %indvars.iv134, i64 %offset.idx
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load154 = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !10
  %54 = fmul <2 x double> %wide.load154, <double 2.000000e+00, double 2.000000e+00>
  %55 = fsub <2 x double> %wide.load, %54
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %46, i64 %indvars.iv134, i64 %offset.idx
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load155 = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !10
  %58 = fadd <2 x double> %wide.load155, %55
  %59 = fmul <2 x double> %58, <double 1.250000e-01, double 1.250000e-01>
  %60 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv139, i64 %indvars.iv.next135, i64 %offset.idx
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load156 = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !10
  %62 = fsub <2 x double> %wide.load156, %54
  %63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv139, i64 %49, i64 %offset.idx
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load157 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !10
  %65 = fadd <2 x double> %wide.load157, %62
  %66 = fmul <2 x double> %65, <double 1.250000e-01, double 1.250000e-01>
  %67 = fadd <2 x double> %59, %66
  %68 = add nuw nsw i64 %offset.idx, 1
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv139, i64 %indvars.iv134, i64 %68
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load158 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !10
  %71 = fsub <2 x double> %wide.load158, %54
  %72 = add nsw i64 %offset.idx, -1
  %73 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv139, i64 %indvars.iv134, i64 %72
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load159 = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !10
  %75 = fadd <2 x double> %wide.load159, %71
  %76 = fmul <2 x double> %75, <double 1.250000e-01, double 1.250000e-01>
  %77 = fadd <2 x double> %67, %76
  %78 = fadd <2 x double> %wide.load154, %77
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv139, i64 %indvars.iv134, i64 %offset.idx
  %80 = bitcast double* %79 to <2 x double>*
  store <2 x double> %78, <2 x double>* %80, align 8, !alias.scope !13, !noalias !10
  %index.next = add nuw nsw i64 %index, 2
  %81 = icmp eq i64 %index.next, 118
  br i1 %81, label %for.inc203.us.loopexit196, label %vector.body, !llvm.loop !15

for.inc200.us:                                    ; preds = %for.inc200.us.preheader, %for.inc200.us
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %for.inc200.us ], [ 1, %for.inc200.us.preheader ]
  %arrayidx119.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %45, i64 %indvars.iv134, i64 %indvars.iv129
  %82 = load double, double* %arrayidx119.us, align 8
  %arrayidx125.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv139, i64 %indvars.iv134, i64 %indvars.iv129
  %83 = load double, double* %arrayidx125.us, align 8
  %mul126.us = fmul double %83, 2.000000e+00
  %sub127.us = fsub double %82, %mul126.us
  %arrayidx134.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %46, i64 %indvars.iv134, i64 %indvars.iv129
  %84 = load double, double* %arrayidx134.us, align 8
  %add135.us = fadd double %84, %sub127.us
  %mul136.us = fmul double %add135.us, 1.250000e-01
  %arrayidx143.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv139, i64 %indvars.iv.next135, i64 %indvars.iv129
  %85 = load double, double* %arrayidx143.us, align 8
  %sub151.us = fsub double %85, %mul126.us
  %arrayidx158.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv139, i64 %49, i64 %indvars.iv129
  %86 = load double, double* %arrayidx158.us, align 8
  %add159.us = fadd double %86, %sub151.us
  %mul160.us = fmul double %add159.us, 1.250000e-01
  %add161.us = fadd double %mul136.us, %mul160.us
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %arrayidx168.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv139, i64 %indvars.iv134, i64 %indvars.iv.next130
  %87 = load double, double* %arrayidx168.us, align 8
  %sub176.us = fsub double %87, %mul126.us
  %88 = add nsw i64 %indvars.iv129, -1
  %arrayidx183.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv139, i64 %indvars.iv134, i64 %88
  %89 = load double, double* %arrayidx183.us, align 8
  %add184.us = fadd double %89, %sub176.us
  %mul185.us = fmul double %add184.us, 1.250000e-01
  %add186.us = fadd double %add161.us, %mul185.us
  %add193.us = fadd double %83, %add186.us
  %arrayidx199.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv139, i64 %indvars.iv134, i64 %indvars.iv129
  store double %add193.us, double* %arrayidx199.us, align 8
  %exitcond133 = icmp eq i64 %indvars.iv.next130, 119
  br i1 %exitcond133, label %for.inc203.us.loopexit, label %for.inc200.us, !llvm.loop !16

for.inc203.us.loopexit:                           ; preds = %for.inc200.us
  br label %for.inc203.us

for.inc203.us.loopexit196:                        ; preds = %vector.body
  br label %for.inc203.us

for.inc203.us:                                    ; preds = %for.inc203.us.loopexit196, %for.inc203.us.loopexit
  %exitcond138 = icmp eq i64 %indvars.iv.next135, 119
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond138, label %for.inc206, label %for.cond109.preheader.us

for.inc206:                                       ; preds = %for.inc203.us
  %exitcond144 = icmp eq i64 %45, 119
  br i1 %exitcond144, label %for.inc209, label %for.cond105.preheader

for.inc209:                                       ; preds = %for.inc206
  %inc210 = add nuw nsw i32 %storemerge113, 1
  %exitcond145 = icmp eq i32 %inc210, 501
  br i1 %exitcond145, label %for.end211, label %for.cond1.preheader

for.end211:                                       ; preds = %for.inc209
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [120 x [120 x double]]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc21, %entry
  %indvars.iv24 = phi i64 [ 0, %entry ], [ %indvars.iv.next25, %for.inc21 ]
  %3 = mul nuw nsw i64 %indvars.iv24, 120
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc18, %for.cond2.preheader
  %indvars.iv20 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next21, %for.inc18 ]
  %mul83 = add nuw nsw i64 %indvars.iv20, %3
  %add = mul nuw nsw i64 %mul83, 120
  br label %for.body7

for.body7:                                        ; preds = %for.inc, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %for.inc ]
  %4 = add nuw nsw i64 %indvars.iv, %add
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body7
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body7, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv24, i64 %indvars.iv20, i64 %indvars.iv
  %8 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %for.inc18, label %for.body7

for.inc18:                                        ; preds = %for.inc
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next21, 120
  br i1 %exitcond23, label %for.inc21, label %for.cond5.preheader

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next25, 120
  br i1 %exitcond28, label %for.end23, label %for.cond2.preheader

for.end23:                                        ; preds = %for.inc21
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

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
