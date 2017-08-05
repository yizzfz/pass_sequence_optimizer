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
for.cond1.preheader.lr.ph:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc22, %for.cond1.preheader.lr.ph
  %indvars.iv27 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next28, %for.inc22 ]
  %0 = trunc i64 %indvars.iv27 to i32
  %sub = add i32 %0, 120
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc19, %for.cond1.preheader
  %indvars.iv23 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next24, %for.inc19 ]
  %1 = trunc i64 %indvars.iv23 to i32
  %add = add i32 %sub, %1
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.cond4.preheader
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next.1, %for.inc ]
  %2 = trunc i64 %indvars.iv to i32
  %add7 = sub nuw nsw i32 %add, %2
  %conv = sitofp i32 %add7 to double
  %mul = fmul double %conv, 1.000000e+01
  %div = fdiv double %mul, 1.200000e+02
  %arrayidx12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv27, i64 %indvars.iv23, i64 %indvars.iv
  store double %div, double* %arrayidx12, align 8
  %arrayidx18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv27, i64 %indvars.iv23, i64 %indvars.iv
  store double %div, double* %arrayidx18, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %3 = trunc i64 %indvars.iv.next to i32
  %add7.1 = sub nuw nsw i32 %add, %3
  %conv.1 = sitofp i32 %add7.1 to double
  %mul.1 = fmul double %conv.1, 1.000000e+01
  %div.1 = fdiv double %mul.1, 1.200000e+02
  %arrayidx12.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv27, i64 %indvars.iv23, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx12.1, align 8
  %arrayidx18.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv27, i64 %indvars.iv23, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx18.1, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %for.inc19, label %for.inc

for.inc19:                                        ; preds = %for.inc
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, 120
  br i1 %exitcond26, label %for.inc22, label %for.cond4.preheader

for.inc22:                                        ; preds = %for.inc19
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next28, 120
  br i1 %exitcond30, label %for.end24, label %for.cond1.preheader

for.end24:                                        ; preds = %for.inc22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32 %tsteps, i32 %n, [120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %entry, %for.inc209
  %t.0114 = phi i32 [ 1, %entry ], [ %inc210, %for.inc209 ]
  br label %for.cond8.preheader.lr.ph

for.cond8.preheader.lr.ph:                        ; preds = %for.cond4.preheader.preheader, %for.inc98
  %indvar163 = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvar.next164, %for.inc98 ]
  %indvars.iv121 = phi i64 [ 1, %for.cond4.preheader.preheader ], [ %indvars.iv.next122, %for.inc98 ]
  %0 = add nuw nsw i64 %indvar163, 1
  %1 = add nuw nsw i64 %indvar163, 2
  %2 = add nuw nsw i64 %indvars.iv121, 1
  %3 = add nsw i64 %indvars.iv121, -1
  br label %for.cond8.preheader.us

for.cond8.preheader.us:                           ; preds = %for.inc95.us, %for.cond8.preheader.lr.ph
  %indvar165 = phi i64 [ %indvar.next166, %for.inc95.us ], [ 0, %for.cond8.preheader.lr.ph ]
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %for.inc95.us ], [ 1, %for.cond8.preheader.lr.ph ]
  %4 = add nuw nsw i64 %indvar165, 1
  %scevgep167 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %0, i64 %4, i64 1
  %scevgep169 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %0, i64 %4, i64 119
  %scevgep171 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvar163, i64 %4, i64 1
  %scevgep173 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %1, i64 %4, i64 119
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %5 = add nsw i64 %indvars.iv116, -1
  %bound0175 = icmp ult double* %scevgep167, %scevgep173
  %bound1176 = icmp ult double* %scevgep171, %scevgep169
  %memcheck.conflict178 = and i1 %bound0175, %bound1176
  br i1 %memcheck.conflict178, label %for.inc.us.preheader, label %vector.body158.preheader

vector.body158.preheader:                         ; preds = %for.cond8.preheader.us
  br label %vector.body158

for.inc.us.preheader:                             ; preds = %for.cond8.preheader.us
  br label %for.inc.us

vector.body158:                                   ; preds = %vector.body158.preheader, %vector.body158
  %index181 = phi i64 [ %index.next182, %vector.body158 ], [ 0, %vector.body158.preheader ]
  %offset.idx185 = or i64 %index181, 1
  %6 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %2, i64 %indvars.iv116, i64 %offset.idx185
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load189 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !1
  %8 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv121, i64 %indvars.iv116, i64 %offset.idx185
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load190 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = fmul <2 x double> %wide.load190, <double 2.000000e+00, double 2.000000e+00>
  %11 = fsub <2 x double> %wide.load189, %10
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %3, i64 %indvars.iv116, i64 %offset.idx185
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load191 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fadd <2 x double> %wide.load191, %11
  %15 = fmul <2 x double> %14, <double 1.250000e-01, double 1.250000e-01>
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv121, i64 %indvars.iv.next117, i64 %offset.idx185
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load192 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fsub <2 x double> %wide.load192, %10
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv121, i64 %5, i64 %offset.idx185
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load193 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = fadd <2 x double> %18, %wide.load193
  %22 = fmul <2 x double> %21, <double 1.250000e-01, double 1.250000e-01>
  %23 = fadd <2 x double> %15, %22
  %24 = add nuw nsw i64 %offset.idx185, 1
  %25 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv121, i64 %indvars.iv116, i64 %24
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load194 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = fsub <2 x double> %wide.load194, %10
  %28 = add nsw i64 %offset.idx185, -1
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv121, i64 %indvars.iv116, i64 %28
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load195 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fadd <2 x double> %27, %wide.load195
  %32 = fmul <2 x double> %31, <double 1.250000e-01, double 1.250000e-01>
  %33 = fadd <2 x double> %23, %32
  %34 = fadd <2 x double> %wide.load190, %33
  %35 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv121, i64 %indvars.iv116, i64 %offset.idx185
  %36 = bitcast double* %35 to <2 x double>*
  store <2 x double> %34, <2 x double>* %36, align 8, !alias.scope !4, !noalias !1
  %index.next182 = add nuw nsw i64 %index181, 2
  %37 = icmp eq i64 %index.next182, 118
  br i1 %37, label %for.inc95.us.loopexit197, label %vector.body158, !llvm.loop !6

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us ], [ 1, %for.inc.us.preheader ]
  %arrayidx15.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %2, i64 %indvars.iv116, i64 %indvars.iv
  %38 = load double, double* %arrayidx15.us, align 8
  %arrayidx21.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv121, i64 %indvars.iv116, i64 %indvars.iv
  %39 = load double, double* %arrayidx21.us, align 8
  %mul.us = fmul double %39, 2.000000e+00
  %sub22.us = fsub double %38, %mul.us
  %arrayidx29.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %3, i64 %indvars.iv116, i64 %indvars.iv
  %40 = load double, double* %arrayidx29.us, align 8
  %add30.us = fadd double %40, %sub22.us
  %mul31.us = fmul double %add30.us, 1.250000e-01
  %arrayidx38.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv121, i64 %indvars.iv.next117, i64 %indvars.iv
  %41 = load double, double* %arrayidx38.us, align 8
  %sub46.us = fsub double %41, %mul.us
  %arrayidx53.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv121, i64 %5, i64 %indvars.iv
  %42 = load double, double* %arrayidx53.us, align 8
  %add54.us = fadd double %sub46.us, %42
  %mul55.us = fmul double %add54.us, 1.250000e-01
  %add56.us = fadd double %mul31.us, %mul55.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv121, i64 %indvars.iv116, i64 %indvars.iv.next
  %43 = load double, double* %arrayidx63.us, align 8
  %sub71.us = fsub double %43, %mul.us
  %44 = add nsw i64 %indvars.iv, -1
  %arrayidx78.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv121, i64 %indvars.iv116, i64 %44
  %45 = load double, double* %arrayidx78.us, align 8
  %add79.us = fadd double %sub71.us, %45
  %mul80.us = fmul double %add79.us, 1.250000e-01
  %add81.us = fadd double %add56.us, %mul80.us
  %add88.us = fadd double %39, %add81.us
  %arrayidx94.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv121, i64 %indvars.iv116, i64 %indvars.iv
  store double %add88.us, double* %arrayidx94.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %for.inc95.us.loopexit, label %for.inc.us, !llvm.loop !9

for.inc95.us.loopexit:                            ; preds = %for.inc.us
  br label %for.inc95.us

for.inc95.us.loopexit197:                         ; preds = %vector.body158
  br label %for.inc95.us

for.inc95.us:                                     ; preds = %for.inc95.us.loopexit197, %for.inc95.us.loopexit
  %exitcond120 = icmp eq i64 %indvars.iv.next117, 119
  %indvar.next166 = add nuw nsw i64 %indvar165, 1
  br i1 %exitcond120, label %for.inc98, label %for.cond8.preheader.us

for.inc98:                                        ; preds = %for.inc95.us
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %exitcond126 = icmp eq i64 %indvars.iv.next122, 119
  %indvar.next164 = add nuw nsw i64 %indvar163, 1
  br i1 %exitcond126, label %for.cond105.preheader.preheader, label %for.cond8.preheader.lr.ph

for.cond105.preheader.preheader:                  ; preds = %for.inc98
  br label %for.cond105.preheader

for.cond105.preheader:                            ; preds = %for.cond105.preheader.preheader, %for.inc206
  %indvar = phi i64 [ %indvar.next, %for.inc206 ], [ 0, %for.cond105.preheader.preheader ]
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %for.inc206 ], [ 1, %for.cond105.preheader.preheader ]
  %46 = add nuw nsw i64 %indvar, 1
  %47 = add nuw nsw i64 %indvar, 2
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %48 = add nsw i64 %indvars.iv137, -1
  br label %for.cond109.preheader

for.cond109.preheader:                            ; preds = %for.inc203, %for.cond105.preheader
  %indvar143 = phi i64 [ %indvar.next144, %for.inc203 ], [ 0, %for.cond105.preheader ]
  %indvars.iv132 = phi i64 [ %indvars.iv.next133, %for.inc203 ], [ 1, %for.cond105.preheader ]
  %49 = add nuw nsw i64 %indvar143, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %46, i64 %49, i64 1
  %scevgep146 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %46, i64 %49, i64 119
  %scevgep148 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvar, i64 %49, i64 1
  %scevgep150 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %47, i64 %49, i64 119
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %50 = add nsw i64 %indvars.iv132, -1
  %bound0 = icmp ult double* %scevgep, %scevgep150
  %bound1 = icmp ult double* %scevgep148, %scevgep146
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.inc200.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond109.preheader
  br label %vector.body

for.inc200.preheader:                             ; preds = %for.cond109.preheader
  br label %for.inc200

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv.next138, i64 %indvars.iv132, i64 %offset.idx
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !10
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv137, i64 %indvars.iv132, i64 %offset.idx
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load152 = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !10
  %55 = fmul <2 x double> %wide.load152, <double 2.000000e+00, double 2.000000e+00>
  %56 = fsub <2 x double> %wide.load, %55
  %57 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %48, i64 %indvars.iv132, i64 %offset.idx
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load153 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !10
  %59 = fadd <2 x double> %wide.load153, %56
  %60 = fmul <2 x double> %59, <double 1.250000e-01, double 1.250000e-01>
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv137, i64 %indvars.iv.next133, i64 %offset.idx
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load154 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !10
  %63 = fsub <2 x double> %wide.load154, %55
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv137, i64 %50, i64 %offset.idx
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load155 = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !10
  %66 = fadd <2 x double> %63, %wide.load155
  %67 = fmul <2 x double> %66, <double 1.250000e-01, double 1.250000e-01>
  %68 = fadd <2 x double> %60, %67
  %69 = add nuw nsw i64 %offset.idx, 1
  %70 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv137, i64 %indvars.iv132, i64 %69
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load156 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !10
  %72 = fsub <2 x double> %wide.load156, %55
  %73 = add nsw i64 %offset.idx, -1
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv137, i64 %indvars.iv132, i64 %73
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load157 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !10
  %76 = fadd <2 x double> %72, %wide.load157
  %77 = fmul <2 x double> %76, <double 1.250000e-01, double 1.250000e-01>
  %78 = fadd <2 x double> %68, %77
  %79 = fadd <2 x double> %wide.load152, %78
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv137, i64 %indvars.iv132, i64 %offset.idx
  %81 = bitcast double* %80 to <2 x double>*
  store <2 x double> %79, <2 x double>* %81, align 8, !alias.scope !13, !noalias !10
  %index.next = add nuw nsw i64 %index, 2
  %82 = icmp eq i64 %index.next, 118
  br i1 %82, label %for.inc203.loopexit196, label %vector.body, !llvm.loop !15

for.inc200:                                       ; preds = %for.inc200.preheader, %for.inc200
  %indvars.iv127 = phi i64 [ %indvars.iv.next128, %for.inc200 ], [ 1, %for.inc200.preheader ]
  %arrayidx119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv.next138, i64 %indvars.iv132, i64 %indvars.iv127
  %83 = load double, double* %arrayidx119, align 8
  %arrayidx125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv137, i64 %indvars.iv132, i64 %indvars.iv127
  %84 = load double, double* %arrayidx125, align 8
  %mul126 = fmul double %84, 2.000000e+00
  %sub127 = fsub double %83, %mul126
  %arrayidx134 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %48, i64 %indvars.iv132, i64 %indvars.iv127
  %85 = load double, double* %arrayidx134, align 8
  %add135 = fadd double %85, %sub127
  %mul136 = fmul double %add135, 1.250000e-01
  %arrayidx143 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv137, i64 %indvars.iv.next133, i64 %indvars.iv127
  %86 = load double, double* %arrayidx143, align 8
  %sub151 = fsub double %86, %mul126
  %arrayidx158 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv137, i64 %50, i64 %indvars.iv127
  %87 = load double, double* %arrayidx158, align 8
  %add159 = fadd double %sub151, %87
  %mul160 = fmul double %add159, 1.250000e-01
  %add161 = fadd double %mul136, %mul160
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %arrayidx168 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv137, i64 %indvars.iv132, i64 %indvars.iv.next128
  %88 = load double, double* %arrayidx168, align 8
  %sub176 = fsub double %88, %mul126
  %89 = add nsw i64 %indvars.iv127, -1
  %arrayidx183 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv137, i64 %indvars.iv132, i64 %89
  %90 = load double, double* %arrayidx183, align 8
  %add184 = fadd double %sub176, %90
  %mul185 = fmul double %add184, 1.250000e-01
  %add186 = fadd double %add161, %mul185
  %add193 = fadd double %84, %add186
  %arrayidx199 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv137, i64 %indvars.iv132, i64 %indvars.iv127
  store double %add193, double* %arrayidx199, align 8
  %exitcond131 = icmp eq i64 %indvars.iv.next128, 119
  br i1 %exitcond131, label %for.inc203.loopexit, label %for.inc200, !llvm.loop !16

for.inc203.loopexit:                              ; preds = %for.inc200
  br label %for.inc203

for.inc203.loopexit196:                           ; preds = %vector.body
  br label %for.inc203

for.inc203:                                       ; preds = %for.inc203.loopexit196, %for.inc203.loopexit
  %exitcond136 = icmp eq i64 %indvars.iv.next133, 119
  %indvar.next144 = add nuw nsw i64 %indvar143, 1
  br i1 %exitcond136, label %for.inc206, label %for.cond109.preheader

for.inc206:                                       ; preds = %for.inc203
  %exitcond141 = icmp eq i64 %indvars.iv.next138, 119
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond141, label %for.inc209, label %for.cond105.preheader

for.inc209:                                       ; preds = %for.inc206
  %inc210 = add nuw nsw i32 %t.0114, 1
  %exitcond142 = icmp eq i32 %inc210, 501
  br i1 %exitcond142, label %for.end211, label %for.cond4.preheader.preheader

for.end211:                                       ; preds = %for.inc209
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [120 x [120 x double]]* nocapture readonly %A) unnamed_addr #0 {
for.cond2.preheader.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc21, %for.cond2.preheader.preheader
  %indvars.iv27 = phi i64 [ 0, %for.cond2.preheader.preheader ], [ %indvars.iv.next28, %for.inc21 ]
  %3 = mul nuw nsw i64 %indvars.iv27, 120
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc18, %for.cond2.preheader
  %indvars.iv23 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next24, %for.inc18 ]
  %mul815 = add nuw nsw i64 %indvars.iv23, %3
  %sext = mul nuw nsw i64 %mul815, 515396075520
  %4 = lshr exact i64 %sext, 32
  br label %for.body7

for.body7:                                        ; preds = %for.inc, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %for.inc ]
  %5 = add nuw nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body7
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body7, %if.then
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv27, i64 %indvars.iv23, i64 %indvars.iv
  %9 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %for.inc18, label %for.body7

for.inc18:                                        ; preds = %for.inc
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, 120
  br i1 %exitcond26, label %for.inc21, label %for.cond5.preheader

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next28, 120
  br i1 %exitcond31, label %for.end23, label %for.cond2.preheader

for.end23:                                        ; preds = %for.inc21
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
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
