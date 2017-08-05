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
  %A = alloca [120 x [120 x [120 x double]]]*, align 8
  %B = alloca [120 x [120 x [120 x double]]]*, align 8
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 120, i32* %n, align 4
  %call = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %0 = bitcast [120 x [120 x [120 x double]]]** %A to i8**
  store i8* %call, i8** %0, align 8
  %call1 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %1 = bitcast [120 x [120 x [120 x double]]]** %B to i8**
  store i8* %call1, i8** %1, align 8
  %2 = load i32, i32* %n, align 4
  %arraydecay = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay2 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 %2, [120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  %3 = bitcast [120 x [120 x [120 x double]]]** %A to [120 x [120 x double]]**
  %4 = load [120 x [120 x double]]*, [120 x [120 x double]]** %3, align 8
  %5 = bitcast [120 x [120 x [120 x double]]]** %B to [120 x [120 x double]]**
  %6 = load [120 x [120 x double]]*, [120 x [120 x double]]** %5, align 8
  tail call fastcc void @kernel_heat_3d(i32 %2, [120 x [120 x double]]* %4, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = load i32, i32* %argc.addr, align 4
  %cmp = icmp sgt i32 %7, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %8 = load i8**, i8*** %argv.addr, align 8
  %9 = load i8*, i8** %8, align 8
  %strcmpload = load i8, i8* %9, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %10 = load i32, i32* %n, align 4
  %11 = bitcast [120 x [120 x [120 x double]]]** %A to [120 x [120 x double]]**
  %12 = load [120 x [120 x double]]*, [120 x [120 x double]]** %11, align 8
  tail call fastcc void @print_array(i32 %10, [120 x [120 x double]]* %12)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  %13 = bitcast [120 x [120 x [120 x double]]]** %A to i8**
  %14 = load i8*, i8** %13, align 8
  tail call void @free(i8* %14) #4
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
  %cmp9 = icmp sgt i32 %n, 0
  br i1 %cmp9, label %for.cond1.preheader.lr.ph, label %for.end24

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = load i32, i32* %n.addr, align 4
  %wide.trip.count.1 = zext i32 %0 to i64
  %wide.trip.count48 = zext i32 %0 to i64
  %1 = sext i32 %0 to i64
  %cmp25 = icmp sgt i32 %0, 0
  %conv8 = sitofp i32 %0 to double
  %2 = load [120 x [120 x double]]*, [120 x [120 x double]]** %B.addr, align 8
  %3 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8
  %i.promoted = load i32, i32* %i, align 4
  br i1 %cmp25, label %for.cond1.preheader.us.preheader, label %for.cond.for.end24_crit_edge.loopexit44

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %4 = sext i32 %i.promoted to i64
  %xtraiter = and i32 %0, 1
  %5 = icmp sgt i32 %0, 0
  %6 = icmp eq i32 %xtraiter, 0
  %7 = icmp eq i32 %0, 1
  %8 = insertelement <2 x double> undef, double %conv8, i32 0
  %div.us.us.v.i1.2 = shufflevector <2 x double> %8, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.inc22.us
  %indvars.iv49 = phi i64 [ %4, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next50, %for.inc22.us ]
  br i1 %5, label %for.cond4.preheader.us.us.preheader, label %for.inc22.us

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  %9 = trunc i64 %indvars.iv49 to i32
  br label %for.cond4.preheader.us.us

for.inc22.us.loopexit:                            ; preds = %for.inc19.us.us
  br label %for.inc22.us

for.inc22.us:                                     ; preds = %for.inc22.us.loopexit, %for.cond1.preheader.us
  %inc.lcssa8.lcssa.us = phi i32 [ 0, %for.cond1.preheader.us ], [ %0, %for.inc22.us.loopexit ]
  %indvars.iv.next50 = add nsw i64 %indvars.iv49, 1
  %cmp.us = icmp slt i64 %indvars.iv.next50, %1
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond.for.end24_crit_edge.loopexit

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.inc19.us.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %for.inc19.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %10 = trunc i64 %indvars.iv46 to i32
  %sub.us.us = add i32 %10, %9
  %add.us.us = add i32 %sub.us.us, %0
  br i1 %6, label %for.body6.us.us.prol.loopexit, label %for.body6.us.us.prol

for.body6.us.us.prol:                             ; preds = %for.cond4.preheader.us.us
  %conv.us.us.prol = sitofp i32 %add.us.us to double
  %mul.us.us.prol = fmul double %conv.us.us.prol, 1.000000e+01
  %div.us.us.prol = fdiv double %mul.us.us.prol, %conv8
  %arrayidx12.us.us.prol = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv49, i64 %indvars.iv46, i64 0
  store double %div.us.us.prol, double* %arrayidx12.us.us.prol, align 8
  %arrayidx18.us.us.prol = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv49, i64 %indvars.iv46, i64 0
  store double %div.us.us.prol, double* %arrayidx18.us.us.prol, align 8
  br label %for.body6.us.us.prol.loopexit

for.body6.us.us.prol.loopexit:                    ; preds = %for.body6.us.us.prol, %for.cond4.preheader.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.us.us.prol ], [ 0, %for.cond4.preheader.us.us ]
  br i1 %7, label %for.inc19.us.us, label %for.body6.us.us.preheader

for.body6.us.us.preheader:                        ; preds = %for.body6.us.us.prol.loopexit
  br label %for.body6.us.us

for.inc19.us.us.loopexit:                         ; preds = %for.body6.us.us
  br label %for.inc19.us.us

for.inc19.us.us:                                  ; preds = %for.inc19.us.us.loopexit, %for.body6.us.us.prol.loopexit
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond = icmp eq i64 %indvars.iv.next47, %wide.trip.count48
  br i1 %exitcond, label %for.inc22.us.loopexit, label %for.cond4.preheader.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.body6.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body6.us.us ], [ %indvars.iv.unr.ph, %for.body6.us.us.preheader ]
  %11 = trunc i64 %indvars.iv to i32
  %add7.us.us = sub i32 %add.us.us, %11
  %conv.us.us = sitofp i32 %add7.us.us to double
  %arrayidx12.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv49, i64 %indvars.iv46, i64 %indvars.iv
  %arrayidx18.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv49, i64 %indvars.iv46, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %12 = trunc i64 %indvars.iv.next to i32
  %add7.us.us.1 = sub i32 %add.us.us, %12
  %conv.us.us.1 = sitofp i32 %add7.us.us.1 to double
  %mul.us.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us.us, i32 0
  %mul.us.us.v.i0.2 = insertelement <2 x double> %mul.us.us.v.i0.1, double %conv.us.us.1, i32 1
  %mul.us.us = fmul <2 x double> %mul.us.us.v.i0.2, <double 1.000000e+01, double 1.000000e+01>
  %div.us.us = fdiv <2 x double> %mul.us.us, %div.us.us.v.i1.2
  %13 = bitcast double* %arrayidx12.us.us to <2 x double>*
  %14 = bitcast double* %arrayidx18.us.us to <2 x double>*
  store <2 x double> %div.us.us, <2 x double>* %13, align 8
  store <2 x double> %div.us.us, <2 x double>* %14, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.inc19.us.us.loopexit, label %for.body6.us.us

for.cond.for.end24_crit_edge.loopexit:            ; preds = %for.inc22.us
  %15 = trunc i64 %indvars.iv.next50 to i32
  br label %for.cond.for.end24_crit_edge

for.cond.for.end24_crit_edge.loopexit44:          ; preds = %for.cond1.preheader.lr.ph
  %k.promoted = load i32, i32* %k, align 4
  %16 = add i32 %i.promoted, 1
  %17 = icmp sgt i32 %0, %16
  %smax = select i1 %17, i32 %0, i32 %16
  br label %for.cond.for.end24_crit_edge

for.cond.for.end24_crit_edge:                     ; preds = %for.cond.for.end24_crit_edge.loopexit44, %for.cond.for.end24_crit_edge.loopexit
  %inc.lcssa8.lcssa14.lcssa = phi i32 [ %inc.lcssa8.lcssa.us, %for.cond.for.end24_crit_edge.loopexit ], [ %k.promoted, %for.cond.for.end24_crit_edge.loopexit44 ]
  %inc23.lcssa = phi i32 [ %15, %for.cond.for.end24_crit_edge.loopexit ], [ %smax, %for.cond.for.end24_crit_edge.loopexit44 ]
  store i32 %inc23.lcssa, i32* %i, align 4
  store i32 %inc.lcssa8.lcssa14.lcssa, i32* %k, align 4
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
  %sub15 = add nsw i32 %n, -1
  %sub10231 = add nsw i32 %n, -1
  %0 = sext i32 %n to i64
  %sub10626 = add nsw i32 %n, -1
  %sub102 = add nsw i64 %0, -1
  %sub11022 = add nsw i32 %n, -1
  %sub106 = add nsw i32 %n, -1
  %1 = load [120 x [120 x double]]*, [120 x [120 x double]]** %B.addr, align 8
  %2 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8
  %3 = load i32, i32* %n.addr, align 4
  %4 = sext i32 %3 to i64
  %5 = sext i32 %3 to i64
  %sub110 = add nsw i64 %4, -1
  %sub510 = add nsw i32 %3, -1
  %sub = add nsw i64 %5, -1
  %sub97 = add nsw i32 %3, -1
  %6 = load i32, i32* %n.addr, align 4
  %7 = sext i32 %6 to i64
  %8 = sext i32 %6 to i64
  %sub5 = add nsw i64 %7, -1
  %9 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8
  %10 = load [120 x [120 x double]]*, [120 x [120 x double]]** %B.addr, align 8
  %sub9 = add nsw i64 %8, -1
  %t.promoted = load i32, i32* %t, align 4
  %wide.trip.count = zext i32 %sub106 to i64
  %11 = icmp sgt i32 %sub15, 1
  %12 = icmp sgt i32 %sub10231, 1
  %13 = icmp sgt i32 %sub10626, 1
  %14 = icmp sgt i32 %sub11022, 1
  %15 = icmp sgt i32 %sub510, 1
  %16 = icmp sgt i32 %sub97, 1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc209
  %inc21049 = phi i32 [ %t.promoted, %entry ], [ %inc210, %for.inc209 ]
  br i1 %11, label %for.cond4.preheader.preheader, label %for.cond101.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  br label %for.cond4.preheader

for.cond101.preheader.loopexit:                   ; preds = %for.inc98
  br label %for.cond101.preheader

for.cond101.preheader:                            ; preds = %for.cond101.preheader.loopexit, %for.cond1.preheader
  br i1 %12, label %for.cond105.preheader.preheader, label %for.inc209

for.cond105.preheader.preheader:                  ; preds = %for.cond101.preheader
  br label %for.cond105.preheader

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc98
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %for.inc98 ], [ 1, %for.cond4.preheader.preheader ]
  br i1 %15, label %for.cond8.preheader.lr.ph, label %for.inc98

for.cond8.preheader.lr.ph:                        ; preds = %for.cond4.preheader
  %17 = add nuw nsw i64 %indvars.iv56, 1
  %18 = add nsw i64 %indvars.iv56, -1
  br i1 %16, label %for.cond8.preheader.us.preheader, label %for.inc98

for.cond8.preheader.us.preheader:                 ; preds = %for.cond8.preheader.lr.ph
  br label %for.cond8.preheader.us

for.cond8.preheader.us:                           ; preds = %for.cond8.preheader.us.preheader, %for.inc95.us
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %for.inc95.us ], [ 1, %for.cond8.preheader.us.preheader ]
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %19 = add nsw i64 %indvars.iv53, -1
  br label %for.body11.us

for.body11.us:                                    ; preds = %for.body11.us, %for.cond8.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body11.us ], [ 1, %for.cond8.preheader.us ]
  %arrayidx15.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %9, i64 %17, i64 %indvars.iv53, i64 %indvars.iv
  %20 = load double, double* %arrayidx15.us, align 8
  %arrayidx21.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %9, i64 %indvars.iv56, i64 %indvars.iv53, i64 %indvars.iv
  %21 = load double, double* %arrayidx21.us, align 8
  %arrayidx29.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %9, i64 %18, i64 %indvars.iv53, i64 %indvars.iv
  %22 = load double, double* %arrayidx29.us, align 8
  %arrayidx38.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %9, i64 %indvars.iv56, i64 %indvars.iv.next54, i64 %indvars.iv
  %23 = load double, double* %arrayidx38.us, align 8
  %24 = insertelement <2 x double> undef, double %21, i32 0
  %mul.us.v.i0.2 = shufflevector <2 x double> %24, <2 x double> undef, <2 x i32> zeroinitializer
  %mul.us = fmul <2 x double> %mul.us.v.i0.2, <double 2.000000e+00, double 2.000000e+00>
  %sub22.us.v.i0.1 = insertelement <2 x double> undef, double %20, i32 0
  %sub22.us.v.i0.2 = insertelement <2 x double> %sub22.us.v.i0.1, double %23, i32 1
  %sub22.us = fsub <2 x double> %sub22.us.v.i0.2, %mul.us
  %arrayidx53.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %9, i64 %indvars.iv56, i64 %19, i64 %indvars.iv
  %25 = load double, double* %arrayidx53.us, align 8
  %add30.us.v.i1.1 = insertelement <2 x double> undef, double %22, i32 0
  %add30.us.v.i1.2 = insertelement <2 x double> %add30.us.v.i1.1, double %25, i32 1
  %add30.us = fadd <2 x double> %sub22.us, %add30.us.v.i1.2
  %mul31.us = fmul <2 x double> %add30.us, <double 1.250000e-01, double 1.250000e-01>
  %mul31.us.v.r1 = extractelement <2 x double> %mul31.us, i32 0
  %mul31.us.v.r2 = extractelement <2 x double> %mul31.us, i32 1
  %add56.us = fadd double %mul31.us.v.r1, %mul31.us.v.r2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %9, i64 %indvars.iv56, i64 %indvars.iv53, i64 %indvars.iv.next
  %26 = load double, double* %arrayidx63.us, align 8
  %arrayidx69.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %9, i64 %indvars.iv56, i64 %indvars.iv53, i64 %indvars.iv
  %27 = load double, double* %arrayidx69.us, align 8
  %mul70.us = fmul double %27, 2.000000e+00
  %sub71.us = fsub double %26, %mul70.us
  %28 = add nsw i64 %indvars.iv, -1
  %arrayidx78.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %9, i64 %indvars.iv56, i64 %indvars.iv53, i64 %28
  %29 = load double, double* %arrayidx78.us, align 8
  %add79.us = fadd double %sub71.us, %29
  %mul80.us = fmul double %add79.us, 1.250000e-01
  %add81.us = fadd double %add56.us, %mul80.us
  %arrayidx87.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %9, i64 %indvars.iv56, i64 %indvars.iv53, i64 %indvars.iv
  %30 = load double, double* %arrayidx87.us, align 8
  %add88.us = fadd double %add81.us, %30
  %arrayidx94.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %10, i64 %indvars.iv56, i64 %indvars.iv53, i64 %indvars.iv
  store double %add88.us, double* %arrayidx94.us, align 8
  %cmp10.us = icmp slt i64 %indvars.iv.next, %sub9
  br i1 %cmp10.us, label %for.body11.us, label %for.inc95.us

for.inc95.us:                                     ; preds = %for.body11.us
  %cmp6.us = icmp slt i64 %indvars.iv.next54, %sub5
  br i1 %cmp6.us, label %for.cond8.preheader.us, label %for.inc98.loopexit

for.inc98.loopexit:                               ; preds = %for.inc95.us
  br label %for.inc98

for.inc98:                                        ; preds = %for.inc98.loopexit, %for.cond8.preheader.lr.ph, %for.cond4.preheader
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %cmp2 = icmp slt i64 %indvars.iv.next57, %sub
  br i1 %cmp2, label %for.cond4.preheader, label %for.cond101.preheader.loopexit

for.cond105.preheader:                            ; preds = %for.cond105.preheader.preheader, %for.inc206
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %for.inc206 ], [ 1, %for.cond105.preheader.preheader ]
  br i1 %13, label %for.cond109.preheader.lr.ph, label %for.inc206

for.cond109.preheader.lr.ph:                      ; preds = %for.cond105.preheader
  %31 = add nuw nsw i64 %indvars.iv66, 1
  %32 = add nsw i64 %indvars.iv66, -1
  br i1 %14, label %for.cond109.preheader.us.preheader, label %for.inc206

for.cond109.preheader.us.preheader:               ; preds = %for.cond109.preheader.lr.ph
  br label %for.cond109.preheader.us

for.cond109.preheader.us:                         ; preds = %for.cond109.preheader.us.preheader, %for.inc203.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.inc203.us ], [ 1, %for.cond109.preheader.us.preheader ]
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %33 = add nsw i64 %indvars.iv63, -1
  br label %for.body112.us

for.body112.us:                                   ; preds = %for.body112.us, %for.cond109.preheader.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.body112.us ], [ 1, %for.cond109.preheader.us ]
  %arrayidx119.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %31, i64 %indvars.iv63, i64 %indvars.iv60
  %34 = load double, double* %arrayidx119.us, align 8
  %arrayidx125.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv60
  %35 = load double, double* %arrayidx125.us, align 8
  %arrayidx134.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %32, i64 %indvars.iv63, i64 %indvars.iv60
  %36 = load double, double* %arrayidx134.us, align 8
  %arrayidx143.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv.next64, i64 %indvars.iv60
  %37 = load double, double* %arrayidx143.us, align 8
  %38 = insertelement <2 x double> undef, double %35, i32 0
  %mul126.us.v.i0.2 = shufflevector <2 x double> %38, <2 x double> undef, <2 x i32> zeroinitializer
  %mul126.us = fmul <2 x double> %mul126.us.v.i0.2, <double 2.000000e+00, double 2.000000e+00>
  %sub127.us.v.i0.1 = insertelement <2 x double> undef, double %34, i32 0
  %sub127.us.v.i0.2 = insertelement <2 x double> %sub127.us.v.i0.1, double %37, i32 1
  %sub127.us = fsub <2 x double> %sub127.us.v.i0.2, %mul126.us
  %arrayidx158.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %33, i64 %indvars.iv60
  %39 = load double, double* %arrayidx158.us, align 8
  %add135.us.v.i1.1 = insertelement <2 x double> undef, double %36, i32 0
  %add135.us.v.i1.2 = insertelement <2 x double> %add135.us.v.i1.1, double %39, i32 1
  %add135.us = fadd <2 x double> %sub127.us, %add135.us.v.i1.2
  %mul136.us = fmul <2 x double> %add135.us, <double 1.250000e-01, double 1.250000e-01>
  %mul136.us.v.r1 = extractelement <2 x double> %mul136.us, i32 0
  %mul136.us.v.r2 = extractelement <2 x double> %mul136.us, i32 1
  %add161.us = fadd double %mul136.us.v.r1, %mul136.us.v.r2
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %arrayidx168.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv.next61
  %40 = load double, double* %arrayidx168.us, align 8
  %arrayidx174.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv60
  %41 = load double, double* %arrayidx174.us, align 8
  %mul175.us = fmul double %41, 2.000000e+00
  %sub176.us = fsub double %40, %mul175.us
  %42 = add nsw i64 %indvars.iv60, -1
  %arrayidx183.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv63, i64 %42
  %43 = load double, double* %arrayidx183.us, align 8
  %add184.us = fadd double %sub176.us, %43
  %mul185.us = fmul double %add184.us, 1.250000e-01
  %add186.us = fadd double %add161.us, %mul185.us
  %arrayidx192.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv60
  %44 = load double, double* %arrayidx192.us, align 8
  %add193.us = fadd double %add186.us, %44
  %arrayidx199.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv60
  store double %add193.us, double* %arrayidx199.us, align 8
  %cmp111.us = icmp slt i64 %indvars.iv.next61, %sub110
  br i1 %cmp111.us, label %for.body112.us, label %for.inc203.us

for.inc203.us:                                    ; preds = %for.body112.us
  %exitcond = icmp eq i64 %indvars.iv.next64, %wide.trip.count
  br i1 %exitcond, label %for.inc206.loopexit, label %for.cond109.preheader.us

for.inc206.loopexit:                              ; preds = %for.inc203.us
  br label %for.inc206

for.inc206:                                       ; preds = %for.inc206.loopexit, %for.cond109.preheader.lr.ph, %for.cond105.preheader
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %cmp103 = icmp slt i64 %indvars.iv.next67, %sub102
  br i1 %cmp103, label %for.cond105.preheader, label %for.inc209.loopexit

for.inc209.loopexit:                              ; preds = %for.inc206
  br label %for.inc209

for.inc209:                                       ; preds = %for.inc209.loopexit, %for.cond101.preheader
  %inc210 = add nsw i32 %inc21049, 1
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
  %3 = load i32, i32* %n.addr, align 4
  %cmp10 = icmp sgt i32 %3, 0
  br i1 %cmp10, label %for.cond2.preheader.lr.ph, label %for.end23

for.cond2.preheader.lr.ph:                        ; preds = %entry
  %4 = load i32, i32* %n.addr, align 4
  %wide.trip.count50 = zext i32 %4 to i64
  %wide.trip.count = zext i32 %4 to i64
  %5 = sext i32 %4 to i64
  %6 = sext i32 %4 to i64
  %cmp36 = icmp sgt i32 %4, 0
  %7 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8
  %i.promoted = load i32, i32* %i, align 4
  br i1 %cmp36, label %for.cond2.preheader.us.preheader, label %for.cond.for.end23_crit_edge.loopexit45

for.cond2.preheader.us.preheader:                 ; preds = %for.cond2.preheader.lr.ph
  %8 = sext i32 %i.promoted to i64
  %9 = icmp sgt i32 %4, 0
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.preheader.us.preheader, %for.inc21.us
  %indvars.iv52 = phi i64 [ %8, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next53, %for.inc21.us ]
  br i1 %9, label %for.cond5.preheader.us.us.preheader, label %for.inc21.us

for.cond5.preheader.us.us.preheader:              ; preds = %for.cond2.preheader.us
  %10 = mul nsw i64 %6, %indvars.iv52
  %11 = trunc i64 %10 to i32
  br label %for.cond5.preheader.us.us

for.inc21.us.loopexit:                            ; preds = %for.inc18.us.us
  br label %for.inc21.us

for.inc21.us:                                     ; preds = %for.inc21.us.loopexit, %for.cond2.preheader.us
  %inc.lcssa9.lcssa.us = phi i32 [ 0, %for.cond2.preheader.us ], [ %4, %for.inc21.us.loopexit ]
  %indvars.iv.next53 = add nsw i64 %indvars.iv52, 1
  %cmp.us = icmp slt i64 %indvars.iv.next53, %5
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.cond.for.end23_crit_edge.loopexit

for.cond5.preheader.us.us:                        ; preds = %for.cond5.preheader.us.us.preheader, %for.inc18.us.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.inc18.us.us ], [ 0, %for.cond5.preheader.us.us.preheader ]
  %12 = trunc i64 %indvars.iv48 to i32
  %mul83.us.us = add i32 %11, %12
  %add.us.us = mul i32 %mul83.us.us, %4
  %13 = zext i32 %add.us.us to i64
  br label %for.body7.us.us

for.inc18.us.us:                                  ; preds = %if.end.us.us
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next49, %wide.trip.count50
  br i1 %exitcond51, label %for.inc21.us.loopexit, label %for.cond5.preheader.us.us

for.body7.us.us:                                  ; preds = %if.end.us.us, %for.cond5.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end.us.us ], [ 0, %for.cond5.preheader.us.us ]
  %14 = add i64 %13, %indvars.iv
  %15 = trunc i64 %14 to i32
  %rem.us.us = srem i32 %15, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %if.end.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %if.end.us.us

if.end.us.us:                                     ; preds = %if.then.us.us, %for.body7.us.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %7, i64 %indvars.iv52, i64 %indvars.iv48, i64 %indvars.iv
  %18 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc18.us.us, label %for.body7.us.us

for.cond.for.end23_crit_edge.loopexit:            ; preds = %for.inc21.us
  %19 = trunc i64 %indvars.iv.next53 to i32
  br label %for.cond.for.end23_crit_edge

for.cond.for.end23_crit_edge.loopexit45:          ; preds = %for.cond2.preheader.lr.ph
  %k.promoted = load i32, i32* %k, align 4
  %20 = add i32 %i.promoted, 1
  %21 = icmp sgt i32 %4, %20
  %smax = select i1 %21, i32 %4, i32 %20
  br label %for.cond.for.end23_crit_edge

for.cond.for.end23_crit_edge:                     ; preds = %for.cond.for.end23_crit_edge.loopexit45, %for.cond.for.end23_crit_edge.loopexit
  %inc.lcssa9.lcssa15.lcssa = phi i32 [ %inc.lcssa9.lcssa.us, %for.cond.for.end23_crit_edge.loopexit ], [ %k.promoted, %for.cond.for.end23_crit_edge.loopexit45 ]
  %inc22.lcssa = phi i32 [ %19, %for.cond.for.end23_crit_edge.loopexit ], [ %smax, %for.cond.for.end23_crit_edge.loopexit45 ]
  store i32 %inc22.lcssa, i32* %i, align 4
  store i32 %inc.lcssa9.lcssa15.lcssa, i32* %k, align 4
  br label %for.end23

for.end23:                                        ; preds = %for.cond.for.end23_crit_edge, %entry
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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
