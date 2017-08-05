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
  tail call fastcc void @init_array([120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay3 = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay4 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d([120 x [120 x double]]* %arraydecay3, [120 x [120 x double]]* %arraydecay4)
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
  %arraydecay6 = bitcast i8* %call to [120 x [120 x double]]*
  tail call fastcc void @print_array([120 x [120 x double]]* %arraydecay6)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc22, %entry
  %indvars.iv27 = phi i64 [ 0, %entry ], [ %indvars.iv.next28, %for.inc22 ]
  %0 = trunc i64 %indvars.iv27 to i32
  %sub = add i32 %0, 120
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc19, %for.cond1.preheader
  %indvars.iv23 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next24, %for.inc19 ]
  %1 = trunc i64 %indvars.iv23 to i32
  %add = add i32 %sub, %1
  br label %for.inc

for.inc:                                          ; preds = %for.cond4.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc ], [ 0, %for.cond4.preheader ]
  %2 = trunc i64 %indvars.iv to i32
  %add7 = sub i32 %add, %2
  %conv = sitofp i32 %add7 to double
  %mul = fmul double %conv, 1.000000e+01
  %div = fdiv double %mul, 1.200000e+02
  %arrayidx12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv27, i64 %indvars.iv23, i64 %indvars.iv
  store double %div, double* %arrayidx12, align 8
  %arrayidx18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv27, i64 %indvars.iv23, i64 %indvars.iv
  store double %div, double* %arrayidx18, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %3 = trunc i64 %indvars.iv.next to i32
  %add7.1 = sub i32 %add, %3
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
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc209, %entry
  %t.0114 = phi i32 [ 1, %entry ], [ %inc210, %for.inc209 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.cond1.preheader, %for.inc98
  %indvar171 = phi i64 [ 0, %for.cond1.preheader ], [ %indvar.next172, %for.inc98 ]
  %indvars.iv124 = phi i64 [ 1, %for.cond1.preheader ], [ %indvars.iv.next125, %for.inc98 ]
  %0 = add nuw nsw i64 %indvar171, 1
  %1 = add nuw nsw i64 %indvar171, 2
  %2 = add nuw nsw i64 %indvars.iv124, 1
  %3 = add nsw i64 %indvars.iv124, -1
  br label %for.cond8.preheader.us

for.cond8.preheader.us:                           ; preds = %for.cond4.preheader, %for.inc95.us
  %indvar173 = phi i64 [ 0, %for.cond4.preheader ], [ %indvar.next174, %for.inc95.us ]
  %indvars.iv119 = phi i64 [ 1, %for.cond4.preheader ], [ %indvars.iv.next120, %for.inc95.us ]
  %4 = add nuw nsw i64 %indvar173, 1
  %scevgep175 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %0, i64 %4, i64 1
  %scevgep177 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %0, i64 %4, i64 119
  %scevgep179 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvar171, i64 %4, i64 1
  %scevgep181 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %1, i64 %4, i64 119
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %5 = add nsw i64 %indvars.iv119, -1
  %bound0183 = icmp ult double* %scevgep175, %scevgep181
  %bound1184 = icmp ult double* %scevgep179, %scevgep177
  %memcheck.conflict186 = and i1 %bound0183, %bound1184
  br i1 %memcheck.conflict186, label %for.inc.us.preheader, label %vector.body166.preheader

vector.body166.preheader:                         ; preds = %for.cond8.preheader.us
  br label %vector.body166

for.inc.us.preheader:                             ; preds = %for.cond8.preheader.us
  br label %for.inc.us

vector.body166:                                   ; preds = %vector.body166.preheader, %vector.body166
  %index189 = phi i64 [ %index.next190, %vector.body166 ], [ 0, %vector.body166.preheader ]
  %offset.idx193 = or i64 %index189, 1
  %6 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %2, i64 %indvars.iv119, i64 %offset.idx193
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load197 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !1
  %8 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv124, i64 %indvars.iv119, i64 %offset.idx193
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load198 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = fmul <2 x double> %wide.load198, <double 2.000000e+00, double 2.000000e+00>
  %11 = fsub <2 x double> %wide.load197, %10
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %3, i64 %indvars.iv119, i64 %offset.idx193
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load199 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fadd <2 x double> %wide.load199, %11
  %15 = fmul <2 x double> %14, <double 1.250000e-01, double 1.250000e-01>
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv124, i64 %indvars.iv.next120, i64 %offset.idx193
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load200 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = bitcast double* %8 to <2 x double>*
  %wide.load201 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !1
  %19 = fmul <2 x double> %wide.load201, <double 2.000000e+00, double 2.000000e+00>
  %20 = fsub <2 x double> %wide.load200, %19
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv124, i64 %5, i64 %offset.idx193
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load202 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = fadd <2 x double> %wide.load202, %20
  %24 = fmul <2 x double> %23, <double 1.250000e-01, double 1.250000e-01>
  %25 = fadd <2 x double> %15, %24
  %26 = add nuw nsw i64 %offset.idx193, 1
  %27 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv124, i64 %indvars.iv119, i64 %26
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load203 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = bitcast double* %8 to <2 x double>*
  %wide.load204 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = fmul <2 x double> %wide.load204, <double 2.000000e+00, double 2.000000e+00>
  %31 = fsub <2 x double> %wide.load203, %30
  %32 = add nsw i64 %offset.idx193, -1
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv124, i64 %indvars.iv119, i64 %32
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load205 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %wide.load205, %31
  %36 = fmul <2 x double> %35, <double 1.250000e-01, double 1.250000e-01>
  %37 = fadd <2 x double> %25, %36
  %38 = bitcast double* %8 to <2 x double>*
  %wide.load206 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !1
  %39 = fadd <2 x double> %wide.load206, %37
  %40 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv124, i64 %indvars.iv119, i64 %offset.idx193
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> %39, <2 x double>* %41, align 8, !alias.scope !4, !noalias !1
  %index.next190 = add nuw nsw i64 %index189, 2
  %42 = icmp eq i64 %index.next190, 118
  br i1 %42, label %for.inc95.us.loopexit208, label %vector.body166, !llvm.loop !6

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us ], [ 1, %for.inc.us.preheader ]
  %arrayidx15.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %2, i64 %indvars.iv119, i64 %indvars.iv
  %43 = load double, double* %arrayidx15.us, align 8
  %arrayidx21.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv124, i64 %indvars.iv119, i64 %indvars.iv
  %44 = load double, double* %arrayidx21.us, align 8
  %mul.us = fmul double %44, 2.000000e+00
  %sub22.us = fsub double %43, %mul.us
  %arrayidx29.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %3, i64 %indvars.iv119, i64 %indvars.iv
  %45 = load double, double* %arrayidx29.us, align 8
  %add30.us = fadd double %45, %sub22.us
  %mul31.us = fmul double %add30.us, 1.250000e-01
  %arrayidx38.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv124, i64 %indvars.iv.next120, i64 %indvars.iv
  %46 = load double, double* %arrayidx38.us, align 8
  %arrayidx44.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv124, i64 %indvars.iv119, i64 %indvars.iv
  %47 = load double, double* %arrayidx44.us, align 8
  %mul45.us = fmul double %47, 2.000000e+00
  %sub46.us = fsub double %46, %mul45.us
  %arrayidx53.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv124, i64 %5, i64 %indvars.iv
  %48 = load double, double* %arrayidx53.us, align 8
  %add54.us = fadd double %48, %sub46.us
  %mul55.us = fmul double %add54.us, 1.250000e-01
  %add56.us = fadd double %mul31.us, %mul55.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv124, i64 %indvars.iv119, i64 %indvars.iv.next
  %49 = load double, double* %arrayidx63.us, align 8
  %arrayidx69.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv124, i64 %indvars.iv119, i64 %indvars.iv
  %50 = load double, double* %arrayidx69.us, align 8
  %mul70.us = fmul double %50, 2.000000e+00
  %sub71.us = fsub double %49, %mul70.us
  %51 = add nsw i64 %indvars.iv, -1
  %arrayidx78.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv124, i64 %indvars.iv119, i64 %51
  %52 = load double, double* %arrayidx78.us, align 8
  %add79.us = fadd double %52, %sub71.us
  %mul80.us = fmul double %add79.us, 1.250000e-01
  %add81.us = fadd double %add56.us, %mul80.us
  %arrayidx87.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv124, i64 %indvars.iv119, i64 %indvars.iv
  %53 = load double, double* %arrayidx87.us, align 8
  %add88.us = fadd double %53, %add81.us
  %arrayidx94.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv124, i64 %indvars.iv119, i64 %indvars.iv
  store double %add88.us, double* %arrayidx94.us, align 8
  %exitcond118 = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond118, label %for.inc95.us.loopexit, label %for.inc.us, !llvm.loop !9

for.inc95.us.loopexit:                            ; preds = %for.inc.us
  br label %for.inc95.us

for.inc95.us.loopexit208:                         ; preds = %vector.body166
  br label %for.inc95.us

for.inc95.us:                                     ; preds = %for.inc95.us.loopexit208, %for.inc95.us.loopexit
  %exitcond123 = icmp eq i64 %indvars.iv.next120, 119
  %indvar.next174 = add nuw nsw i64 %indvar173, 1
  br i1 %exitcond123, label %for.inc98, label %for.cond8.preheader.us

for.inc98:                                        ; preds = %for.inc95.us
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %exitcond129 = icmp eq i64 %indvars.iv.next125, 119
  %indvar.next172 = add nuw nsw i64 %indvar171, 1
  br i1 %exitcond129, label %for.cond105.preheader.preheader, label %for.cond4.preheader

for.cond105.preheader.preheader:                  ; preds = %for.inc98
  br label %for.cond105.preheader

for.cond105.preheader:                            ; preds = %for.cond105.preheader.preheader, %for.inc206
  %indvar = phi i64 [ %indvar.next, %for.inc206 ], [ 0, %for.cond105.preheader.preheader ]
  %indvars.iv141 = phi i64 [ %indvars.iv.next142, %for.inc206 ], [ 1, %for.cond105.preheader.preheader ]
  %54 = add nuw nsw i64 %indvar, 1
  %55 = add nuw nsw i64 %indvar, 2
  %56 = add nuw nsw i64 %indvars.iv141, 1
  %57 = add nsw i64 %indvars.iv141, -1
  br label %for.cond109.preheader.us

for.cond109.preheader.us:                         ; preds = %for.cond105.preheader, %for.inc203.us
  %indvar148 = phi i64 [ 0, %for.cond105.preheader ], [ %indvar.next149, %for.inc203.us ]
  %indvars.iv136 = phi i64 [ 1, %for.cond105.preheader ], [ %indvars.iv.next137, %for.inc203.us ]
  %58 = add nuw nsw i64 %indvar148, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %54, i64 %58, i64 1
  %scevgep151 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %54, i64 %58, i64 119
  %scevgep153 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvar, i64 %58, i64 1
  %scevgep155 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %55, i64 %58, i64 119
  %indvars.iv.next137 = add nuw nsw i64 %indvars.iv136, 1
  %59 = add nsw i64 %indvars.iv136, -1
  %bound0 = icmp ult double* %scevgep, %scevgep155
  %bound1 = icmp ult double* %scevgep153, %scevgep151
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.inc200.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond109.preheader.us
  br label %vector.body

for.inc200.us.preheader:                          ; preds = %for.cond109.preheader.us
  br label %for.inc200.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %60 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %56, i64 %indvars.iv136, i64 %offset.idx
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !10
  %62 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv141, i64 %indvars.iv136, i64 %offset.idx
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load157 = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !10
  %64 = fmul <2 x double> %wide.load157, <double 2.000000e+00, double 2.000000e+00>
  %65 = fsub <2 x double> %wide.load, %64
  %66 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %57, i64 %indvars.iv136, i64 %offset.idx
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load158 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !10
  %68 = fadd <2 x double> %wide.load158, %65
  %69 = fmul <2 x double> %68, <double 1.250000e-01, double 1.250000e-01>
  %70 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv141, i64 %indvars.iv.next137, i64 %offset.idx
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load159 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !10
  %72 = bitcast double* %62 to <2 x double>*
  %wide.load160 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !10
  %73 = fmul <2 x double> %wide.load160, <double 2.000000e+00, double 2.000000e+00>
  %74 = fsub <2 x double> %wide.load159, %73
  %75 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv141, i64 %59, i64 %offset.idx
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load161 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !10
  %77 = fadd <2 x double> %wide.load161, %74
  %78 = fmul <2 x double> %77, <double 1.250000e-01, double 1.250000e-01>
  %79 = fadd <2 x double> %69, %78
  %80 = add nuw nsw i64 %offset.idx, 1
  %81 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv141, i64 %indvars.iv136, i64 %80
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load162 = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !10
  %83 = bitcast double* %62 to <2 x double>*
  %wide.load163 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !10
  %84 = fmul <2 x double> %wide.load163, <double 2.000000e+00, double 2.000000e+00>
  %85 = fsub <2 x double> %wide.load162, %84
  %86 = add nsw i64 %offset.idx, -1
  %87 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv141, i64 %indvars.iv136, i64 %86
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load164 = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !10
  %89 = fadd <2 x double> %wide.load164, %85
  %90 = fmul <2 x double> %89, <double 1.250000e-01, double 1.250000e-01>
  %91 = fadd <2 x double> %79, %90
  %92 = bitcast double* %62 to <2 x double>*
  %wide.load165 = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !10
  %93 = fadd <2 x double> %wide.load165, %91
  %94 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv141, i64 %indvars.iv136, i64 %offset.idx
  %95 = bitcast double* %94 to <2 x double>*
  store <2 x double> %93, <2 x double>* %95, align 8, !alias.scope !13, !noalias !10
  %index.next = add nuw nsw i64 %index, 2
  %96 = icmp eq i64 %index.next, 118
  br i1 %96, label %for.inc203.us.loopexit207, label %vector.body, !llvm.loop !15

for.inc200.us:                                    ; preds = %for.inc200.us.preheader, %for.inc200.us
  %indvars.iv131 = phi i64 [ %indvars.iv.next132, %for.inc200.us ], [ 1, %for.inc200.us.preheader ]
  %arrayidx119.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %56, i64 %indvars.iv136, i64 %indvars.iv131
  %97 = load double, double* %arrayidx119.us, align 8
  %arrayidx125.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv141, i64 %indvars.iv136, i64 %indvars.iv131
  %98 = load double, double* %arrayidx125.us, align 8
  %mul126.us = fmul double %98, 2.000000e+00
  %sub127.us = fsub double %97, %mul126.us
  %arrayidx134.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %57, i64 %indvars.iv136, i64 %indvars.iv131
  %99 = load double, double* %arrayidx134.us, align 8
  %add135.us = fadd double %99, %sub127.us
  %mul136.us = fmul double %add135.us, 1.250000e-01
  %arrayidx143.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv141, i64 %indvars.iv.next137, i64 %indvars.iv131
  %100 = load double, double* %arrayidx143.us, align 8
  %arrayidx149.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv141, i64 %indvars.iv136, i64 %indvars.iv131
  %101 = load double, double* %arrayidx149.us, align 8
  %mul150.us = fmul double %101, 2.000000e+00
  %sub151.us = fsub double %100, %mul150.us
  %arrayidx158.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv141, i64 %59, i64 %indvars.iv131
  %102 = load double, double* %arrayidx158.us, align 8
  %add159.us = fadd double %102, %sub151.us
  %mul160.us = fmul double %add159.us, 1.250000e-01
  %add161.us = fadd double %mul136.us, %mul160.us
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %arrayidx168.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv141, i64 %indvars.iv136, i64 %indvars.iv.next132
  %103 = load double, double* %arrayidx168.us, align 8
  %arrayidx174.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv141, i64 %indvars.iv136, i64 %indvars.iv131
  %104 = load double, double* %arrayidx174.us, align 8
  %mul175.us = fmul double %104, 2.000000e+00
  %sub176.us = fsub double %103, %mul175.us
  %105 = add nsw i64 %indvars.iv131, -1
  %arrayidx183.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv141, i64 %indvars.iv136, i64 %105
  %106 = load double, double* %arrayidx183.us, align 8
  %add184.us = fadd double %106, %sub176.us
  %mul185.us = fmul double %add184.us, 1.250000e-01
  %add186.us = fadd double %add161.us, %mul185.us
  %arrayidx192.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv141, i64 %indvars.iv136, i64 %indvars.iv131
  %107 = load double, double* %arrayidx192.us, align 8
  %add193.us = fadd double %107, %add186.us
  %arrayidx199.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv141, i64 %indvars.iv136, i64 %indvars.iv131
  store double %add193.us, double* %arrayidx199.us, align 8
  %exitcond135 = icmp eq i64 %indvars.iv.next132, 119
  br i1 %exitcond135, label %for.inc203.us.loopexit, label %for.inc200.us, !llvm.loop !16

for.inc203.us.loopexit:                           ; preds = %for.inc200.us
  br label %for.inc203.us

for.inc203.us.loopexit207:                        ; preds = %vector.body
  br label %for.inc203.us

for.inc203.us:                                    ; preds = %for.inc203.us.loopexit207, %for.inc203.us.loopexit
  %exitcond140 = icmp eq i64 %indvars.iv.next137, 119
  %indvar.next149 = add nuw nsw i64 %indvar148, 1
  br i1 %exitcond140, label %for.inc206, label %for.cond109.preheader.us

for.inc206:                                       ; preds = %for.inc203.us
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %exitcond146 = icmp eq i64 %indvars.iv.next142, 119
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond146, label %for.inc209, label %for.cond105.preheader

for.inc209:                                       ; preds = %for.inc206
  %inc210 = add nuw nsw i32 %t.0114, 1
  %exitcond147 = icmp eq i32 %inc210, 501
  br i1 %exitcond147, label %for.end211, label %for.cond1.preheader

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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc21, %entry
  %indvars.iv27 = phi i64 [ 0, %entry ], [ %indvars.iv.next28, %for.inc21 ]
  %3 = mul nuw nsw i64 %indvars.iv27, 120
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc18, %for.cond2.preheader
  %indvars.iv23 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next24, %for.inc18 ]
  %mul815 = add nuw nsw i64 %indvars.iv23, %3
  %add = mul nuw nsw i64 %mul815, 120
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
  %arrayidx16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv27, i64 %indvars.iv23, i64 %indvars.iv
  %8 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
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
