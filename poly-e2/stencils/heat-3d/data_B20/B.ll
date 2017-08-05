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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %arraydecay = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay2 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay3 = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay4 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %arraydecay3, [120 x [120 x double]]* %arraydecay4)
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
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %arraydecay3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [120 x [120 x double]]* %A, [120 x [120 x double]]* %B) unnamed_addr #2 {
entry:
  %cmp19 = icmp sgt i32 %n, 0
  br i1 %cmp19, label %for.cond1.preheader.lr.ph, label %for.end24

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv8 = sitofp i32 %n to double
  %xtraiter = and i32 %n, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %0 = icmp eq i32 %n, 1
  %wide.trip.count47 = zext i32 %n to i64
  %wide.trip.count.1 = zext i32 %n to i64
  %wide.trip.count50 = zext i32 %n to i64
  br label %for.cond4.preheader.us.us.preheader

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.lr.ph, %for.cond1.for.inc22_crit_edge.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.cond1.for.inc22_crit_edge.us ], [ 0, %for.cond1.preheader.lr.ph ]
  %1 = trunc i64 %indvars.iv48 to i32
  %sub.us = add i32 %1, %n
  br label %for.cond4.preheader.us.us

for.cond1.for.inc22_crit_edge.us:                 ; preds = %for.cond4.for.inc19_crit_edge.us.us
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next49, %wide.trip.count50
  br i1 %exitcond51, label %for.end24.loopexit, label %for.cond4.preheader.us.us.preheader

for.cond4.preheader.us.us:                        ; preds = %for.cond4.for.inc19_crit_edge.us.us, %for.cond4.preheader.us.us.preheader
  %indvars.iv45 = phi i64 [ 0, %for.cond4.preheader.us.us.preheader ], [ %indvars.iv.next46, %for.cond4.for.inc19_crit_edge.us.us ]
  %2 = trunc i64 %indvars.iv45 to i32
  %add.us.us = add i32 %sub.us, %2
  br i1 %lcmp.mod, label %for.inc.us.us.prol.loopexit, label %for.inc.us.us.prol

for.inc.us.us.prol:                               ; preds = %for.cond4.preheader.us.us
  %conv.us.us.prol = sitofp i32 %add.us.us to double
  %mul.us.us.prol = fmul double %conv.us.us.prol, 1.000000e+01
  %div.us.us.prol = fdiv double %mul.us.us.prol, %conv8
  %arrayidx12.us.us.prol = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv48, i64 %indvars.iv45, i64 0
  store double %div.us.us.prol, double* %arrayidx12.us.us.prol, align 8
  %arrayidx18.us.us.prol = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv48, i64 %indvars.iv45, i64 0
  store double %div.us.us.prol, double* %arrayidx18.us.us.prol, align 8
  br label %for.inc.us.us.prol.loopexit

for.inc.us.us.prol.loopexit:                      ; preds = %for.inc.us.us.prol, %for.cond4.preheader.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.us.us.prol ], [ 0, %for.cond4.preheader.us.us ]
  br i1 %0, label %for.cond4.for.inc19_crit_edge.us.us, label %for.inc.us.us.preheader

for.inc.us.us.preheader:                          ; preds = %for.inc.us.us.prol.loopexit
  br label %for.inc.us.us

for.cond4.for.inc19_crit_edge.us.us.loopexit:     ; preds = %for.inc.us.us
  br label %for.cond4.for.inc19_crit_edge.us.us

for.cond4.for.inc19_crit_edge.us.us:              ; preds = %for.cond4.for.inc19_crit_edge.us.us.loopexit, %for.inc.us.us.prol.loopexit
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond = icmp eq i64 %indvars.iv.next46, %wide.trip.count47
  br i1 %exitcond, label %for.cond1.for.inc22_crit_edge.us, label %for.cond4.preheader.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us.preheader, %for.inc.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc.us.us ], [ %indvars.iv.unr.ph, %for.inc.us.us.preheader ]
  %3 = trunc i64 %indvars.iv to i32
  %add7.us.us = sub i32 %add.us.us, %3
  %conv.us.us = sitofp i32 %add7.us.us to double
  %mul.us.us = fmul double %conv.us.us, 1.000000e+01
  %div.us.us = fdiv double %mul.us.us, %conv8
  %arrayidx12.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv48, i64 %indvars.iv45, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx12.us.us, align 8
  %arrayidx18.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv48, i64 %indvars.iv45, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx18.us.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %4 = trunc i64 %indvars.iv.next to i32
  %add7.us.us.1 = sub i32 %add.us.us, %4
  %conv.us.us.1 = sitofp i32 %add7.us.us.1 to double
  %mul.us.us.1 = fmul double %conv.us.us.1, 1.000000e+01
  %div.us.us.1 = fdiv double %mul.us.us.1, %conv8
  %arrayidx12.us.us.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv48, i64 %indvars.iv45, i64 %indvars.iv.next
  store double %div.us.us.1, double* %arrayidx12.us.us.1, align 8
  %arrayidx18.us.us.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv48, i64 %indvars.iv45, i64 %indvars.iv.next
  store double %div.us.us.1, double* %arrayidx18.us.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond4.for.inc19_crit_edge.us.us.loopexit, label %for.inc.us.us

for.end24.loopexit:                               ; preds = %for.cond1.for.inc22_crit_edge.us
  br label %for.end24

for.end24:                                        ; preds = %for.end24.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32 %tsteps, i32 %n, [120 x [120 x double]]* %A, [120 x [120 x double]]* %B) unnamed_addr #2 {
entry:
  %sub = add nsw i32 %n, -1
  %cmp2105 = icmp sgt i32 %sub, 1
  %cmp6103 = icmp sgt i32 %sub, 1
  %wide.trip.count118 = zext i32 %sub to i64
  %wide.trip.count = zext i32 %sub to i64
  %wide.trip.count124 = zext i32 %sub to i64
  %cmp103111 = icmp sgt i32 %sub, 1
  %wide.trip.count134 = zext i32 %sub to i64
  %wide.trip.count129 = zext i32 %sub to i64
  %wide.trip.count140 = zext i32 %sub to i64
  %0 = add nsw i64 %wide.trip.count129, -1
  %min.iters.check162 = icmp ult i64 %0, 2
  %n.vec165 = and i64 %0, -2
  %cmp.zero166 = icmp eq i64 %n.vec165, 0
  %ind.end189 = or i64 %0, 1
  %cmp.n190 = icmp eq i64 %0, %n.vec165
  %min.iters.check = icmp ult i64 %0, 2
  %n.vec = and i64 %0, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %0, 1
  %cmp.n = icmp eq i64 %0, %n.vec
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc209, %entry
  %storemerge113 = phi i32 [ 1, %entry ], [ %inc210, %for.inc209 ]
  br i1 %cmp2105, label %for.cond4.preheader.preheader, label %for.inc209

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  br label %for.cond4.preheader

for.cond101.preheader:                            ; preds = %for.inc98
  br i1 %cmp103111, label %for.cond109.preheader.lr.ph.preheader, label %for.inc209

for.cond109.preheader.lr.ph.preheader:            ; preds = %for.cond101.preheader
  br label %for.cond109.preheader.lr.ph

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc98
  %indvar168 = phi i64 [ %indvar.next169, %for.inc98 ], [ 0, %for.cond4.preheader.preheader ]
  %indvars.iv120 = phi i64 [ %indvars.iv.next121, %for.inc98 ], [ 1, %for.cond4.preheader.preheader ]
  %1 = add i64 %indvar168, 1
  %2 = add i64 %indvar168, 2
  br i1 %cmp6103, label %for.cond8.preheader.lr.ph, label %for.inc98

for.cond8.preheader.lr.ph:                        ; preds = %for.cond4.preheader
  %3 = add nuw nsw i64 %indvars.iv120, 1
  %4 = add nsw i64 %indvars.iv120, -1
  br label %for.cond8.preheader.us

for.cond8.preheader.us:                           ; preds = %for.cond8.for.inc95_crit_edge.us, %for.cond8.preheader.lr.ph
  %indvar170 = phi i64 [ %indvar.next171, %for.cond8.for.inc95_crit_edge.us ], [ 0, %for.cond8.preheader.lr.ph ]
  %indvars.iv115 = phi i64 [ %indvars.iv.next116, %for.cond8.for.inc95_crit_edge.us ], [ 1, %for.cond8.preheader.lr.ph ]
  %5 = add i64 %indvar170, 1
  %scevgep172 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %1, i64 %5, i64 1
  %scevgep174 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %1, i64 %5, i64 %wide.trip.count129
  %scevgep176 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvar168, i64 %5, i64 1
  %scevgep178 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %2, i64 %5, i64 %wide.trip.count129
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %6 = add nsw i64 %indvars.iv115, -1
  br i1 %min.iters.check162, label %for.inc.us.preheader, label %min.iters.checked163

min.iters.checked163:                             ; preds = %for.cond8.preheader.us
  br i1 %cmp.zero166, label %for.inc.us.preheader, label %vector.memcheck184

vector.memcheck184:                               ; preds = %min.iters.checked163
  %bound0180 = icmp ult double* %scevgep172, %scevgep178
  %bound1181 = icmp ult double* %scevgep176, %scevgep174
  %memcheck.conflict183 = and i1 %bound0180, %bound1181
  br i1 %memcheck.conflict183, label %for.inc.us.preheader, label %vector.body159.preheader

vector.body159.preheader:                         ; preds = %vector.memcheck184
  br label %vector.body159

vector.body159:                                   ; preds = %vector.body159.preheader, %vector.body159
  %index186 = phi i64 [ %index.next187, %vector.body159 ], [ 0, %vector.body159.preheader ]
  %offset.idx191 = or i64 %index186, 1
  %7 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %3, i64 %indvars.iv115, i64 %offset.idx191
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load195 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1
  %9 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %indvars.iv115, i64 %offset.idx191
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load196 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1
  %11 = fmul <2 x double> %wide.load196, <double 2.000000e+00, double 2.000000e+00>
  %12 = fsub <2 x double> %wide.load195, %11
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %4, i64 %indvars.iv115, i64 %offset.idx191
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load197 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !1
  %15 = fadd <2 x double> %wide.load197, %12
  %16 = fmul <2 x double> %15, <double 1.250000e-01, double 1.250000e-01>
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %indvars.iv.next116, i64 %offset.idx191
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load198 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !1
  %19 = fsub <2 x double> %wide.load198, %11
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %6, i64 %offset.idx191
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load199 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = fadd <2 x double> %19, %wide.load199
  %23 = fmul <2 x double> %22, <double 1.250000e-01, double 1.250000e-01>
  %24 = fadd <2 x double> %16, %23
  %25 = add nuw nsw i64 %offset.idx191, 1
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %indvars.iv115, i64 %25
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load200 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = fsub <2 x double> %wide.load200, %11
  %29 = add nsw i64 %offset.idx191, -1
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %indvars.iv115, i64 %29
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load201 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !1
  %32 = fadd <2 x double> %28, %wide.load201
  %33 = fmul <2 x double> %32, <double 1.250000e-01, double 1.250000e-01>
  %34 = fadd <2 x double> %24, %33
  %35 = fadd <2 x double> %wide.load196, %34
  %36 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv120, i64 %indvars.iv115, i64 %offset.idx191
  %37 = bitcast double* %36 to <2 x double>*
  store <2 x double> %35, <2 x double>* %37, align 8, !alias.scope !4, !noalias !1
  %index.next187 = add i64 %index186, 2
  %38 = icmp eq i64 %index.next187, %n.vec165
  br i1 %38, label %middle.block160, label %vector.body159, !llvm.loop !6

middle.block160:                                  ; preds = %vector.body159
  br i1 %cmp.n190, label %for.cond8.for.inc95_crit_edge.us, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %middle.block160, %vector.memcheck184, %min.iters.checked163, %for.cond8.preheader.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck184 ], [ 1, %min.iters.checked163 ], [ 1, %for.cond8.preheader.us ], [ %ind.end189, %middle.block160 ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us ], [ %indvars.iv.ph, %for.inc.us.preheader ]
  %arrayidx15.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %3, i64 %indvars.iv115, i64 %indvars.iv
  %39 = load double, double* %arrayidx15.us, align 8
  %arrayidx21.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %indvars.iv115, i64 %indvars.iv
  %40 = load double, double* %arrayidx21.us, align 8
  %mul.us = fmul double %40, 2.000000e+00
  %sub22.us = fsub double %39, %mul.us
  %arrayidx29.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %4, i64 %indvars.iv115, i64 %indvars.iv
  %41 = load double, double* %arrayidx29.us, align 8
  %add30.us = fadd double %41, %sub22.us
  %mul31.us = fmul double %add30.us, 1.250000e-01
  %arrayidx38.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %indvars.iv.next116, i64 %indvars.iv
  %42 = load double, double* %arrayidx38.us, align 8
  %sub46.us = fsub double %42, %mul.us
  %arrayidx53.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %6, i64 %indvars.iv
  %43 = load double, double* %arrayidx53.us, align 8
  %add54.us = fadd double %sub46.us, %43
  %mul55.us = fmul double %add54.us, 1.250000e-01
  %add56.us = fadd double %mul31.us, %mul55.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %indvars.iv115, i64 %indvars.iv.next
  %44 = load double, double* %arrayidx63.us, align 8
  %sub71.us = fsub double %44, %mul.us
  %45 = add nsw i64 %indvars.iv, -1
  %arrayidx78.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %indvars.iv115, i64 %45
  %46 = load double, double* %arrayidx78.us, align 8
  %add79.us = fadd double %sub71.us, %46
  %mul80.us = fmul double %add79.us, 1.250000e-01
  %add81.us = fadd double %add56.us, %mul80.us
  %add88.us = fadd double %40, %add81.us
  %arrayidx94.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv120, i64 %indvars.iv115, i64 %indvars.iv
  store double %add88.us, double* %arrayidx94.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond8.for.inc95_crit_edge.us.loopexit, label %for.inc.us, !llvm.loop !9

for.cond8.for.inc95_crit_edge.us.loopexit:        ; preds = %for.inc.us
  br label %for.cond8.for.inc95_crit_edge.us

for.cond8.for.inc95_crit_edge.us:                 ; preds = %for.cond8.for.inc95_crit_edge.us.loopexit, %middle.block160
  %exitcond119 = icmp eq i64 %indvars.iv.next116, %wide.trip.count118
  %indvar.next171 = add i64 %indvar170, 1
  br i1 %exitcond119, label %for.inc98.loopexit, label %for.cond8.preheader.us

for.inc98.loopexit:                               ; preds = %for.cond8.for.inc95_crit_edge.us
  br label %for.inc98

for.inc98:                                        ; preds = %for.inc98.loopexit, %for.cond4.preheader
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond125 = icmp eq i64 %indvars.iv.next121, %wide.trip.count124
  %indvar.next169 = add i64 %indvar168, 1
  br i1 %exitcond125, label %for.cond101.preheader, label %for.cond4.preheader

for.cond109.preheader.lr.ph:                      ; preds = %for.cond109.preheader.lr.ph.preheader, %for.inc206
  %indvar = phi i64 [ %indvar.next, %for.inc206 ], [ 0, %for.cond109.preheader.lr.ph.preheader ]
  %indvars.iv136 = phi i64 [ %indvars.iv.next137, %for.inc206 ], [ 1, %for.cond109.preheader.lr.ph.preheader ]
  %47 = add i64 %indvar, 1
  %48 = add i64 %indvar, 2
  %49 = add nuw nsw i64 %indvars.iv136, 1
  %50 = add nsw i64 %indvars.iv136, -1
  br label %for.cond109.preheader.us

for.cond109.preheader.us:                         ; preds = %for.cond109.for.inc203_crit_edge.us, %for.cond109.preheader.lr.ph
  %indvar144 = phi i64 [ %indvar.next145, %for.cond109.for.inc203_crit_edge.us ], [ 0, %for.cond109.preheader.lr.ph ]
  %indvars.iv131 = phi i64 [ %indvars.iv.next132, %for.cond109.for.inc203_crit_edge.us ], [ 1, %for.cond109.preheader.lr.ph ]
  %51 = add i64 %indvar144, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %47, i64 %51, i64 1
  %scevgep147 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %47, i64 %51, i64 %wide.trip.count129
  %scevgep149 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvar, i64 %51, i64 1
  %scevgep151 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %48, i64 %51, i64 %wide.trip.count129
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %52 = add nsw i64 %indvars.iv131, -1
  br i1 %min.iters.check, label %for.inc200.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond109.preheader.us
  br i1 %cmp.zero, label %for.inc200.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep151
  %bound1 = icmp ult double* %scevgep149, %scevgep147
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.inc200.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %49, i64 %indvars.iv131, i64 %offset.idx
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !10
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv136, i64 %indvars.iv131, i64 %offset.idx
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load153 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !10
  %57 = fmul <2 x double> %wide.load153, <double 2.000000e+00, double 2.000000e+00>
  %58 = fsub <2 x double> %wide.load, %57
  %59 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %50, i64 %indvars.iv131, i64 %offset.idx
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load154 = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !10
  %61 = fadd <2 x double> %wide.load154, %58
  %62 = fmul <2 x double> %61, <double 1.250000e-01, double 1.250000e-01>
  %63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv136, i64 %indvars.iv.next132, i64 %offset.idx
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load155 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !10
  %65 = fsub <2 x double> %wide.load155, %57
  %66 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv136, i64 %52, i64 %offset.idx
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load156 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !10
  %68 = fadd <2 x double> %65, %wide.load156
  %69 = fmul <2 x double> %68, <double 1.250000e-01, double 1.250000e-01>
  %70 = fadd <2 x double> %62, %69
  %71 = add nuw nsw i64 %offset.idx, 1
  %72 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv136, i64 %indvars.iv131, i64 %71
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load157 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !10
  %74 = fsub <2 x double> %wide.load157, %57
  %75 = add nsw i64 %offset.idx, -1
  %76 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv136, i64 %indvars.iv131, i64 %75
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load158 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !10
  %78 = fadd <2 x double> %74, %wide.load158
  %79 = fmul <2 x double> %78, <double 1.250000e-01, double 1.250000e-01>
  %80 = fadd <2 x double> %70, %79
  %81 = fadd <2 x double> %wide.load153, %80
  %82 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv136, i64 %indvars.iv131, i64 %offset.idx
  %83 = bitcast double* %82 to <2 x double>*
  store <2 x double> %81, <2 x double>* %83, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %84 = icmp eq i64 %index.next, %n.vec
  br i1 %84, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond109.for.inc203_crit_edge.us, label %for.inc200.us.preheader

for.inc200.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond109.preheader.us
  %indvars.iv126.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %for.cond109.preheader.us ], [ %ind.end, %middle.block ]
  br label %for.inc200.us

for.inc200.us:                                    ; preds = %for.inc200.us.preheader, %for.inc200.us
  %indvars.iv126 = phi i64 [ %indvars.iv.next127, %for.inc200.us ], [ %indvars.iv126.ph, %for.inc200.us.preheader ]
  %arrayidx119.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %49, i64 %indvars.iv131, i64 %indvars.iv126
  %85 = load double, double* %arrayidx119.us, align 8
  %arrayidx125.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv136, i64 %indvars.iv131, i64 %indvars.iv126
  %86 = load double, double* %arrayidx125.us, align 8
  %mul126.us = fmul double %86, 2.000000e+00
  %sub127.us = fsub double %85, %mul126.us
  %arrayidx134.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %50, i64 %indvars.iv131, i64 %indvars.iv126
  %87 = load double, double* %arrayidx134.us, align 8
  %add135.us = fadd double %87, %sub127.us
  %mul136.us = fmul double %add135.us, 1.250000e-01
  %arrayidx143.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv136, i64 %indvars.iv.next132, i64 %indvars.iv126
  %88 = load double, double* %arrayidx143.us, align 8
  %sub151.us = fsub double %88, %mul126.us
  %arrayidx158.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv136, i64 %52, i64 %indvars.iv126
  %89 = load double, double* %arrayidx158.us, align 8
  %add159.us = fadd double %sub151.us, %89
  %mul160.us = fmul double %add159.us, 1.250000e-01
  %add161.us = fadd double %mul136.us, %mul160.us
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %arrayidx168.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv136, i64 %indvars.iv131, i64 %indvars.iv.next127
  %90 = load double, double* %arrayidx168.us, align 8
  %sub176.us = fsub double %90, %mul126.us
  %91 = add nsw i64 %indvars.iv126, -1
  %arrayidx183.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv136, i64 %indvars.iv131, i64 %91
  %92 = load double, double* %arrayidx183.us, align 8
  %add184.us = fadd double %sub176.us, %92
  %mul185.us = fmul double %add184.us, 1.250000e-01
  %add186.us = fadd double %add161.us, %mul185.us
  %add193.us = fadd double %86, %add186.us
  %arrayidx199.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv136, i64 %indvars.iv131, i64 %indvars.iv126
  store double %add193.us, double* %arrayidx199.us, align 8
  %exitcond130 = icmp eq i64 %indvars.iv.next127, %wide.trip.count129
  br i1 %exitcond130, label %for.cond109.for.inc203_crit_edge.us.loopexit, label %for.inc200.us, !llvm.loop !16

for.cond109.for.inc203_crit_edge.us.loopexit:     ; preds = %for.inc200.us
  br label %for.cond109.for.inc203_crit_edge.us

for.cond109.for.inc203_crit_edge.us:              ; preds = %for.cond109.for.inc203_crit_edge.us.loopexit, %middle.block
  %exitcond135 = icmp eq i64 %indvars.iv.next132, %wide.trip.count134
  %indvar.next145 = add i64 %indvar144, 1
  br i1 %exitcond135, label %for.inc206, label %for.cond109.preheader.us

for.inc206:                                       ; preds = %for.cond109.for.inc203_crit_edge.us
  %indvars.iv.next137 = add nuw nsw i64 %indvars.iv136, 1
  %exitcond141 = icmp eq i64 %indvars.iv.next137, %wide.trip.count140
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond141, label %for.inc209.loopexit, label %for.cond109.preheader.lr.ph

for.inc209.loopexit:                              ; preds = %for.inc206
  br label %for.inc209

for.inc209:                                       ; preds = %for.inc209.loopexit, %for.cond1.preheader, %for.cond101.preheader
  %inc210 = add nuw nsw i32 %storemerge113, 1
  %exitcond142 = icmp eq i32 %inc210, 501
  br i1 %exitcond142, label %for.end211, label %for.cond1.preheader

for.end211:                                       ; preds = %for.inc209
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [120 x [120 x double]]* %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp17 = icmp sgt i32 %n, 0
  br i1 %cmp17, label %for.cond2.preheader.lr.ph, label %for.end23

for.cond2.preheader.lr.ph:                        ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count48 = zext i32 %n to i64
  %wide.trip.count53 = zext i32 %n to i64
  br label %for.cond5.preheader.us.us.preheader

for.cond5.preheader.us.us.preheader:              ; preds = %for.cond2.preheader.lr.ph, %for.cond2.for.inc21_crit_edge.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.cond2.for.inc21_crit_edge.us ], [ 0, %for.cond2.preheader.lr.ph ]
  %4 = mul nsw i64 %indvars.iv50, %3
  %5 = trunc i64 %4 to i32
  br label %for.cond5.preheader.us.us

for.cond2.for.inc21_crit_edge.us:                 ; preds = %for.cond5.for.inc18_crit_edge.us.us
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next51, %wide.trip.count53
  br i1 %exitcond54, label %for.end23.loopexit, label %for.cond5.preheader.us.us.preheader

for.cond5.preheader.us.us:                        ; preds = %for.cond5.for.inc18_crit_edge.us.us, %for.cond5.preheader.us.us.preheader
  %indvars.iv46 = phi i64 [ 0, %for.cond5.preheader.us.us.preheader ], [ %indvars.iv.next47, %for.cond5.for.inc18_crit_edge.us.us ]
  %6 = trunc i64 %indvars.iv46 to i32
  %mul83.us.us = add i32 %6, %5
  %add.us.us = mul i32 %mul83.us.us, %n
  %7 = zext i32 %add.us.us to i64
  br label %for.body7.us.us

for.cond5.for.inc18_crit_edge.us.us:              ; preds = %for.inc.us.us
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, %wide.trip.count48
  br i1 %exitcond49, label %for.cond2.for.inc21_crit_edge.us, label %for.cond5.preheader.us.us

for.body7.us.us:                                  ; preds = %for.inc.us.us, %for.cond5.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us.us ], [ 0, %for.cond5.preheader.us.us ]
  %8 = add i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %rem.us.us = srem i32 %9, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %for.inc.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %for.inc.us.us

for.inc.us.us:                                    ; preds = %if.then.us.us, %for.body7.us.us
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv50, i64 %indvars.iv46, i64 %indvars.iv
  %12 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond5.for.inc18_crit_edge.us.us, label %for.body7.us.us

for.end23.loopexit:                               ; preds = %for.cond2.for.inc21_crit_edge.us
  br label %for.end23

for.end23:                                        ; preds = %for.end23.loopexit, %entry
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %14) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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
