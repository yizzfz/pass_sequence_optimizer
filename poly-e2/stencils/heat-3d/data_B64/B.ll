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
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %n = alloca i32, align 4
  %tsteps = alloca i32, align 4
  %A = alloca [120 x [120 x [120 x double]]]*, align 8
  %B = alloca [120 x [120 x [120 x double]]]*, align 8
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 120, i32* %n, align 4
  store i32 500, i32* %tsteps, align 4
  %call = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %0 = bitcast [120 x [120 x [120 x double]]]** %A to i8**
  store i8* %call, i8** %0, align 8
  %call1 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %1 = bitcast [120 x [120 x [120 x double]]]** %B to i8**
  store i8* %call1, i8** %1, align 8
  %.cast = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay22 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %.cast, [120 x [120 x double]]* %arraydecay22)
  tail call void (...) @polybench_timer_start() #4
  %2 = ptrtoint i8* %call to i64
  %3 = inttoptr i64 %2 to [120 x [120 x double]]*
  %4 = ptrtoint i8* %call1 to i64
  %5 = inttoptr i64 %4 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %3, [120 x [120 x double]]* %5)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %6 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %6, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [120 x [120 x double]]* %A, [120 x [120 x double]]* %B) unnamed_addr #2 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca [120 x [120 x double]]*, align 8
  %B.addr = alloca [120 x [120 x double]]*, align 8
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store [120 x [120 x double]]* %A, [120 x [120 x double]]** %A.addr, align 8
  store [120 x [120 x double]]* %B, [120 x [120 x double]]** %B.addr, align 8
  store i32 0, i32* %i, align 4
  %cmp10 = icmp sgt i32 %n, 0
  br i1 %cmp10, label %for.cond1.preheader.lr.ph, label %for.end24

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %wide.trip.count52 = zext i32 %n to i64
  %0 = sext i32 %n to i64
  br i1 true, label %for.cond1.preheader.us.preheader, label %for.cond.for.end24_crit_edge.loopexit47

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %conv8.us.us = sitofp i32 %n to double
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.inc22.us
  %indvars.iv54 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next55, %for.inc22.us ]
  br i1 true, label %for.cond4.preheader.us.us.preheader, label %for.cond1.preheader.us.for.inc22.us_crit_edge

for.cond1.preheader.us.for.inc22.us_crit_edge:    ; preds = %for.cond1.preheader.us
  br label %for.inc22.us

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  %1 = trunc i64 %indvars.iv54 to i32
  br label %for.cond4.preheader.us.us

for.inc22.us.loopexit:                            ; preds = %for.inc19.us.us
  br label %for.inc22.us

for.inc22.us:                                     ; preds = %for.inc22.us.loopexit, %for.cond1.preheader.us.for.inc22.us_crit_edge
  %indvars.iv.next55 = add nsw i64 %indvars.iv54, 1
  %cmp.us = icmp slt i64 %indvars.iv.next55, %0
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond.for.end24_crit_edge.loopexit

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.inc19.us.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.inc19.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %2 = trunc i64 %indvars.iv50 to i32
  br label %for.inc.us.us

for.inc19.us.us:                                  ; preds = %for.inc.us.us
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, %wide.trip.count52
  br i1 %exitcond53, label %for.inc22.us.loopexit, label %for.cond4.preheader.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us, %for.cond4.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us.us ], [ 0, %for.cond4.preheader.us.us ]
  %3 = trunc i64 %indvars.iv to i32
  %add.us.us = sub i32 %n, %3
  %sub.us.us = add i32 %add.us.us, %1
  %add7.us.us = add i32 %sub.us.us, %2
  %conv.us.us = sitofp i32 %add7.us.us to double
  %mul.us.us = fmul double %conv.us.us, 1.000000e+01
  %div.us.us = fdiv double %mul.us.us, %conv8.us.us
  %arrayidx12.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv54, i64 %indvars.iv50, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx12.us.us, align 8
  %arrayidx18.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv54, i64 %indvars.iv50, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx18.us.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next, %wide.trip.count52
  br i1 %exitcond49, label %for.inc19.us.us, label %for.inc.us.us

for.cond.for.end24_crit_edge.loopexit:            ; preds = %for.inc22.us
  %4 = trunc i64 %indvars.iv.next55 to i32
  br label %for.cond.for.end24_crit_edge

for.cond.for.end24_crit_edge.loopexit47:          ; preds = %for.cond1.preheader.lr.ph
  br label %for.cond.for.end24_crit_edge

for.cond.for.end24_crit_edge:                     ; preds = %for.cond.for.end24_crit_edge.loopexit47, %for.cond.for.end24_crit_edge.loopexit
  %inc23.lcssa = phi i32 [ %4, %for.cond.for.end24_crit_edge.loopexit ], [ undef, %for.cond.for.end24_crit_edge.loopexit47 ]
  store i32 %inc23.lcssa, i32* %i, align 4
  store i32 %n, i32* %k, align 4
  br label %for.end24

for.end24:                                        ; preds = %for.cond.for.end24_crit_edge, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32 %n, [120 x [120 x double]]* %A, [120 x [120 x double]]* %B) unnamed_addr #2 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca [120 x [120 x double]]*, align 8
  %B.addr = alloca [120 x [120 x double]]*, align 8
  %t = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store [120 x [120 x double]]* %A, [120 x [120 x double]]** %A.addr, align 8
  store [120 x [120 x double]]* %B, [120 x [120 x double]]** %B.addr, align 8
  store i32 1, i32* %t, align 4
  %sub16 = add nsw i32 %n, -1
  %0 = sext i32 %n to i64
  %sub102 = add nsw i64 %0, -1
  %wide.trip.count = zext i32 %sub16 to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc209
  %inc21051 = phi i32 [ 1, %entry ], [ %inc210, %for.inc209 ]
  %1 = icmp sgt i32 %sub16, 1
  br i1 %1, label %for.cond4.preheader.preheader, label %for.cond101.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  br label %for.cond4.preheader

for.cond101.preheader.loopexit:                   ; preds = %for.inc98
  br label %for.cond101.preheader

for.cond101.preheader:                            ; preds = %for.cond101.preheader.loopexit, %for.cond1.preheader
  br i1 %1, label %for.cond105.preheader.preheader, label %for.inc209

for.cond105.preheader.preheader:                  ; preds = %for.cond101.preheader
  br label %for.cond105.preheader

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc98
  %indvars.iv56 = phi i64 [ %indvars.iv.next57.pre-phi, %for.inc98 ], [ 1, %for.cond4.preheader.preheader ]
  br i1 true, label %for.cond8.preheader.lr.ph, label %for.cond4.preheader.for.inc98_crit_edge

for.cond4.preheader.for.inc98_crit_edge:          ; preds = %for.cond4.preheader
  %.pre = add nuw nsw i64 %indvars.iv56, 1
  br label %for.inc98

for.cond8.preheader.lr.ph:                        ; preds = %for.cond4.preheader
  %add = add nuw nsw i64 %indvars.iv56, 1
  %sub23 = add nsw i64 %indvars.iv56, -1
  br i1 true, label %for.cond8.preheader.us.preheader, label %for.cond8.preheader.lr.ph.for.inc98_crit_edge

for.cond8.preheader.lr.ph.for.inc98_crit_edge:    ; preds = %for.cond8.preheader.lr.ph
  br label %for.inc98

for.cond8.preheader.us.preheader:                 ; preds = %for.cond8.preheader.lr.ph
  br label %for.cond8.preheader.us

for.cond8.preheader.us:                           ; preds = %for.cond8.preheader.us.preheader, %for.inc95.us
  %indvars.iv54 = phi i64 [ %add34.us, %for.inc95.us ], [ 1, %for.cond8.preheader.us.preheader ]
  %add34.us = add nuw nsw i64 %indvars.iv54, 1
  %sub49.us = add nsw i64 %indvars.iv54, -1
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond8.preheader.us
  %indvars.iv = phi i64 [ %add61.us, %for.inc.us ], [ 1, %for.cond8.preheader.us ]
  %arrayidx15.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %add, i64 %indvars.iv54, i64 %indvars.iv
  %2 = load double, double* %arrayidx15.us, align 8
  %arrayidx21.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv56, i64 %indvars.iv54, i64 %indvars.iv
  %3 = load double, double* %arrayidx21.us, align 8
  %mul.us = fmul double %3, 2.000000e+00
  %arrayidx29.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %sub23, i64 %indvars.iv54, i64 %indvars.iv
  %4 = load double, double* %arrayidx29.us, align 8
  %arrayidx38.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv56, i64 %add34.us, i64 %indvars.iv
  %5 = load double, double* %arrayidx38.us, align 8
  %6 = insertelement <2 x double> undef, double %mul.us, i32 0
  %sub22.us.v.i1.2 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  %sub22.us.v.i0.1 = insertelement <2 x double> undef, double %2, i32 0
  %sub22.us.v.i0.2 = insertelement <2 x double> %sub22.us.v.i0.1, double %5, i32 1
  %sub22.us = fsub <2 x double> %sub22.us.v.i0.2, %sub22.us.v.i1.2
  %sub22.us.v.r1 = extractelement <2 x double> %sub22.us, i32 0
  %arrayidx53.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv56, i64 %sub49.us, i64 %indvars.iv
  %7 = load double, double* %arrayidx53.us, align 8
  %add30.us.v.i1.1 = insertelement <2 x double> undef, double %sub22.us.v.r1, i32 0
  %add30.us.v.i1.2 = insertelement <2 x double> %add30.us.v.i1.1, double %7, i32 1
  %add30.us.v.i0.1 = insertelement <2 x double> undef, double %4, i32 0
  %add30.us.v.i0.2 = shufflevector <2 x double> %add30.us.v.i0.1, <2 x double> %sub22.us, <2 x i32> <i32 0, i32 3>
  %add30.us = fadd <2 x double> %add30.us.v.i0.2, %add30.us.v.i1.2
  %mul31.us = fmul <2 x double> %add30.us, <double 1.250000e-01, double 1.250000e-01>
  %mul31.us.v.r1 = extractelement <2 x double> %mul31.us, i32 0
  %mul31.us.v.r2 = extractelement <2 x double> %mul31.us, i32 1
  %add56.us = fadd double %mul31.us.v.r1, %mul31.us.v.r2
  %add61.us = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv56, i64 %indvars.iv54, i64 %add61.us
  %8 = load double, double* %arrayidx63.us, align 8
  %sub71.us = fsub double %8, %mul.us
  %sub76.us = add nsw i64 %indvars.iv, -1
  %arrayidx78.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv56, i64 %indvars.iv54, i64 %sub76.us
  %9 = load double, double* %arrayidx78.us, align 8
  %add79.us = fadd double %sub71.us, %9
  %mul80.us = fmul double %add79.us, 1.250000e-01
  %add81.us = fadd double %add56.us, %mul80.us
  %add88.us = fadd double %3, %add81.us
  %arrayidx94.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv56, i64 %indvars.iv54, i64 %indvars.iv
  store double %add88.us, double* %arrayidx94.us, align 8
  %cmp10.us = icmp slt i64 %add61.us, %sub102
  br i1 %cmp10.us, label %for.inc.us, label %for.inc95.us

for.inc95.us:                                     ; preds = %for.inc.us
  %cmp6.us = icmp slt i64 %add34.us, %sub102
  br i1 %cmp6.us, label %for.cond8.preheader.us, label %for.inc98.loopexit

for.inc98.loopexit:                               ; preds = %for.inc95.us
  br label %for.inc98

for.inc98:                                        ; preds = %for.inc98.loopexit, %for.cond8.preheader.lr.ph.for.inc98_crit_edge, %for.cond4.preheader.for.inc98_crit_edge
  %indvars.iv.next57.pre-phi = phi i64 [ %add, %for.cond8.preheader.lr.ph.for.inc98_crit_edge ], [ %.pre, %for.cond4.preheader.for.inc98_crit_edge ], [ %add, %for.inc98.loopexit ]
  %cmp2 = icmp slt i64 %indvars.iv.next57.pre-phi, %sub102
  br i1 %cmp2, label %for.cond4.preheader, label %for.cond101.preheader.loopexit

for.cond105.preheader:                            ; preds = %for.cond105.preheader.preheader, %for.inc206
  %indvars.iv63 = phi i64 [ %indvars.iv.next64.pre-phi, %for.inc206 ], [ 1, %for.cond105.preheader.preheader ]
  br i1 true, label %for.cond109.preheader.lr.ph, label %for.cond105.preheader.for.inc206_crit_edge

for.cond105.preheader.for.inc206_crit_edge:       ; preds = %for.cond105.preheader
  %.pre65 = add nuw nsw i64 %indvars.iv63, 1
  br label %for.inc206

for.cond109.preheader.lr.ph:                      ; preds = %for.cond105.preheader
  %add113 = add nuw nsw i64 %indvars.iv63, 1
  %sub128 = add nsw i64 %indvars.iv63, -1
  br i1 true, label %for.cond109.preheader.us.preheader, label %for.cond109.preheader.lr.ph.for.inc206_crit_edge

for.cond109.preheader.lr.ph.for.inc206_crit_edge: ; preds = %for.cond109.preheader.lr.ph
  br label %for.inc206

for.cond109.preheader.us.preheader:               ; preds = %for.cond109.preheader.lr.ph
  br label %for.cond109.preheader.us

for.cond109.preheader.us:                         ; preds = %for.cond109.preheader.us.preheader, %for.inc203.us
  %indvars.iv60 = phi i64 [ %add139.us, %for.inc203.us ], [ 1, %for.cond109.preheader.us.preheader ]
  %add139.us = add nuw nsw i64 %indvars.iv60, 1
  %sub154.us = add nsw i64 %indvars.iv60, -1
  br label %for.inc200.us

for.inc200.us:                                    ; preds = %for.inc200.us, %for.cond109.preheader.us
  %indvars.iv58 = phi i64 [ %add166.us, %for.inc200.us ], [ 1, %for.cond109.preheader.us ]
  %arrayidx119.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %add113, i64 %indvars.iv60, i64 %indvars.iv58
  %10 = load double, double* %arrayidx119.us, align 8
  %arrayidx125.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv63, i64 %indvars.iv60, i64 %indvars.iv58
  %11 = load double, double* %arrayidx125.us, align 8
  %mul126.us = fmul double %11, 2.000000e+00
  %arrayidx134.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %sub128, i64 %indvars.iv60, i64 %indvars.iv58
  %12 = load double, double* %arrayidx134.us, align 8
  %arrayidx143.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv63, i64 %add139.us, i64 %indvars.iv58
  %13 = load double, double* %arrayidx143.us, align 8
  %14 = insertelement <2 x double> undef, double %mul126.us, i32 0
  %sub127.us.v.i1.2 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %sub127.us.v.i0.1 = insertelement <2 x double> undef, double %10, i32 0
  %sub127.us.v.i0.2 = insertelement <2 x double> %sub127.us.v.i0.1, double %13, i32 1
  %sub127.us = fsub <2 x double> %sub127.us.v.i0.2, %sub127.us.v.i1.2
  %sub127.us.v.r1 = extractelement <2 x double> %sub127.us, i32 0
  %arrayidx158.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv63, i64 %sub154.us, i64 %indvars.iv58
  %15 = load double, double* %arrayidx158.us, align 8
  %add135.us.v.i1.1 = insertelement <2 x double> undef, double %sub127.us.v.r1, i32 0
  %add135.us.v.i1.2 = insertelement <2 x double> %add135.us.v.i1.1, double %15, i32 1
  %add135.us.v.i0.1 = insertelement <2 x double> undef, double %12, i32 0
  %add135.us.v.i0.2 = shufflevector <2 x double> %add135.us.v.i0.1, <2 x double> %sub127.us, <2 x i32> <i32 0, i32 3>
  %add135.us = fadd <2 x double> %add135.us.v.i0.2, %add135.us.v.i1.2
  %mul136.us = fmul <2 x double> %add135.us, <double 1.250000e-01, double 1.250000e-01>
  %mul136.us.v.r1 = extractelement <2 x double> %mul136.us, i32 0
  %mul136.us.v.r2 = extractelement <2 x double> %mul136.us, i32 1
  %add161.us = fadd double %mul136.us.v.r1, %mul136.us.v.r2
  %add166.us = add nuw nsw i64 %indvars.iv58, 1
  %arrayidx168.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv63, i64 %indvars.iv60, i64 %add166.us
  %16 = load double, double* %arrayidx168.us, align 8
  %sub176.us = fsub double %16, %mul126.us
  %sub181.us = add nsw i64 %indvars.iv58, -1
  %arrayidx183.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv63, i64 %indvars.iv60, i64 %sub181.us
  %17 = load double, double* %arrayidx183.us, align 8
  %add184.us = fadd double %sub176.us, %17
  %mul185.us = fmul double %add184.us, 1.250000e-01
  %add186.us = fadd double %add161.us, %mul185.us
  %add193.us = fadd double %11, %add186.us
  %arrayidx199.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv63, i64 %indvars.iv60, i64 %indvars.iv58
  store double %add193.us, double* %arrayidx199.us, align 8
  %cmp111.us = icmp slt i64 %add166.us, %sub102
  br i1 %cmp111.us, label %for.inc200.us, label %for.inc203.us

for.inc203.us:                                    ; preds = %for.inc200.us
  %exitcond62 = icmp eq i64 %add139.us, %wide.trip.count
  br i1 %exitcond62, label %for.inc206.loopexit, label %for.cond109.preheader.us

for.inc206.loopexit:                              ; preds = %for.inc203.us
  br label %for.inc206

for.inc206:                                       ; preds = %for.inc206.loopexit, %for.cond109.preheader.lr.ph.for.inc206_crit_edge, %for.cond105.preheader.for.inc206_crit_edge
  %indvars.iv.next64.pre-phi = phi i64 [ %add113, %for.cond109.preheader.lr.ph.for.inc206_crit_edge ], [ %.pre65, %for.cond105.preheader.for.inc206_crit_edge ], [ %add113, %for.inc206.loopexit ]
  %cmp103 = icmp slt i64 %indvars.iv.next64.pre-phi, %sub102
  br i1 %cmp103, label %for.cond105.preheader, label %for.inc209.loopexit

for.inc209.loopexit:                              ; preds = %for.inc206
  br label %for.inc209

for.inc209:                                       ; preds = %for.inc209.loopexit, %for.cond101.preheader
  %inc210 = add nsw i32 %inc21051, 1
  %cmp = icmp slt i32 %inc210, 501
  br i1 %cmp, label %for.cond1.preheader, label %for.end211

for.end211:                                       ; preds = %for.inc209
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [120 x [120 x double]]* %A) unnamed_addr #0 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca [120 x [120 x double]]*, align 8
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store [120 x [120 x double]]* %A, [120 x [120 x double]]** %A.addr, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  store i32 0, i32* %i, align 4
  %cmp12 = icmp sgt i32 %n, 0
  br i1 %cmp12, label %for.cond2.preheader.lr.ph, label %for.end23

for.cond2.preheader.lr.ph:                        ; preds = %entry
  %wide.trip.count55 = zext i32 %n to i64
  %3 = sext i32 %n to i64
  br i1 true, label %for.cond2.preheader.us.preheader, label %for.cond.for.end23_crit_edge.loopexit49

for.cond2.preheader.us.preheader:                 ; preds = %for.cond2.preheader.lr.ph
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.preheader.us.preheader, %for.inc21.us
  %indvars.iv57 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next58, %for.inc21.us ]
  br i1 true, label %for.cond5.preheader.lr.ph.split.us.us, label %for.cond2.preheader.us.for.inc21.us_crit_edge

for.cond2.preheader.us.for.inc21.us_crit_edge:    ; preds = %for.cond2.preheader.us
  br label %for.inc21.us

for.inc21.us.loopexit:                            ; preds = %for.inc18.us.us
  br label %for.inc21.us

for.inc21.us:                                     ; preds = %for.inc21.us.loopexit, %for.cond2.preheader.us.for.inc21.us_crit_edge
  %indvars.iv.next58 = add nsw i64 %indvars.iv57, 1
  %cmp.us = icmp slt i64 %indvars.iv.next58, %3
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.cond.for.end23_crit_edge.loopexit

for.cond5.preheader.us.us:                        ; preds = %for.inc18.us.us, %for.cond5.preheader.lr.ph.split.us.us
  %indvars.iv53 = phi i64 [ 0, %for.cond5.preheader.lr.ph.split.us.us ], [ %indvars.iv.next54, %for.inc18.us.us ]
  %4 = trunc i64 %indvars.iv53 to i32
  %mul83.us.us = add i32 %12, %4
  %add.us.us = mul i32 %mul83.us.us, %n
  %5 = zext i32 %add.us.us to i64
  br label %for.body7.us.us

for.inc18.us.us:                                  ; preds = %for.inc.us.us
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, %wide.trip.count55
  br i1 %exitcond56, label %for.inc21.us.loopexit, label %for.cond5.preheader.us.us

for.body7.us.us:                                  ; preds = %for.inc.us.us, %for.cond5.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us.us ], [ 0, %for.cond5.preheader.us.us ]
  %6 = add i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %rem.us.us = srem i32 %7, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %for.inc.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #5
  br label %for.inc.us.us

for.inc.us.us:                                    ; preds = %if.then.us.us, %for.body7.us.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv
  %10 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next, %wide.trip.count55
  br i1 %exitcond52, label %for.inc18.us.us, label %for.body7.us.us

for.cond5.preheader.lr.ph.split.us.us:            ; preds = %for.cond2.preheader.us
  %11 = mul nsw i64 %indvars.iv57, %3
  %12 = trunc i64 %11 to i32
  br label %for.cond5.preheader.us.us

for.cond.for.end23_crit_edge.loopexit:            ; preds = %for.inc21.us
  %13 = trunc i64 %indvars.iv.next58 to i32
  br label %for.cond.for.end23_crit_edge

for.cond.for.end23_crit_edge.loopexit49:          ; preds = %for.cond2.preheader.lr.ph
  br label %for.cond.for.end23_crit_edge

for.cond.for.end23_crit_edge:                     ; preds = %for.cond.for.end23_crit_edge.loopexit49, %for.cond.for.end23_crit_edge.loopexit
  %inc22.lcssa = phi i32 [ %13, %for.cond.for.end23_crit_edge.loopexit ], [ undef, %for.cond.for.end23_crit_edge.loopexit49 ]
  store i32 %inc22.lcssa, i32* %i, align 4
  store i32 %n, i32* %k, align 4
  br label %for.end23

for.end23:                                        ; preds = %for.cond.for.end23_crit_edge, %entry
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %15) #5
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
