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

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
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
  %4 = sext i32 %i.promoted to i64
  br i1 %cmp25, label %for.cond1.preheader.us.preheader, label %for.cond.for.end24_crit_edge.loopexit44

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %xtraiter = and i32 %0, 1
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc22.us, %for.cond1.preheader.us.preheader
  %indvars.iv49 = phi i64 [ %4, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next50, %for.inc22.us ]
  %5 = trunc i64 %indvars.iv49 to i32
  br label %for.cond4.preheader.us.us

for.inc22.us:                                     ; preds = %for.inc19.us.us
  %indvars.iv.next50 = add nsw i64 %indvars.iv49, 1
  %cmp.us = icmp slt i64 %indvars.iv.next50, %1
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond.for.end24_crit_edge.loopexit

for.cond4.preheader.us.us:                        ; preds = %for.inc19.us.us, %for.cond1.preheader.us
  %indvars.iv46 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next47, %for.inc19.us.us ]
  %6 = icmp eq i32 %xtraiter, 0
  %7 = trunc i64 %indvars.iv46 to i32
  %sub.us.us = add i32 %7, %5
  %add.us.us = add i32 %sub.us.us, %0
  br i1 %6, label %for.inc.us.us.prol.loopexit, label %for.inc.us.us.prol

for.inc.us.us.prol:                               ; preds = %for.cond4.preheader.us.us
  %conv.us.us.prol = sitofp i32 %add.us.us to double
  %mul.us.us.prol = fmul double %conv.us.us.prol, 1.000000e+01
  %div.us.us.prol = fdiv double %mul.us.us.prol, %conv8
  %arrayidx12.us.us.prol = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv49, i64 %indvars.iv46, i64 0
  store double %div.us.us.prol, double* %arrayidx12.us.us.prol, align 8
  %arrayidx18.us.us.prol = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv49, i64 %indvars.iv46, i64 0
  store double %div.us.us.prol, double* %arrayidx18.us.us.prol, align 8
  br label %for.inc.us.us.prol.loopexit

for.inc.us.us.prol.loopexit:                      ; preds = %for.cond4.preheader.us.us, %for.inc.us.us.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.us.us.prol ], [ 0, %for.cond4.preheader.us.us ]
  %8 = icmp eq i32 %0, 1
  br i1 %8, label %for.inc19.us.us, label %for.inc.us.us.preheader

for.inc.us.us.preheader:                          ; preds = %for.inc.us.us.prol.loopexit
  br label %for.inc.us.us

for.inc19.us.us:                                  ; preds = %for.inc.us.us, %for.inc.us.us.prol.loopexit
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond = icmp eq i64 %indvars.iv.next47, %wide.trip.count48
  br i1 %exitcond, label %for.inc22.us, label %for.cond4.preheader.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us.preheader, %for.inc.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc.us.us ], [ %indvars.iv.unr.ph, %for.inc.us.us.preheader ]
  %9 = trunc i64 %indvars.iv to i32
  %add7.us.us = sub i32 %add.us.us, %9
  %conv.us.us = sitofp i32 %add7.us.us to double
  %mul.us.us = fmul double %conv.us.us, 1.000000e+01
  %div.us.us = fdiv double %mul.us.us, %conv8
  %arrayidx12.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv49, i64 %indvars.iv46, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx12.us.us, align 8
  %arrayidx18.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv49, i64 %indvars.iv46, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx18.us.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %10 = trunc i64 %indvars.iv.next to i32
  %add7.us.us.1 = sub i32 %add.us.us, %10
  %conv.us.us.1 = sitofp i32 %add7.us.us.1 to double
  %mul.us.us.1 = fmul double %conv.us.us.1, 1.000000e+01
  %div.us.us.1 = fdiv double %mul.us.us.1, %conv8
  %arrayidx12.us.us.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv49, i64 %indvars.iv46, i64 %indvars.iv.next
  store double %div.us.us.1, double* %arrayidx12.us.us.1, align 8
  %arrayidx18.us.us.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv49, i64 %indvars.iv46, i64 %indvars.iv.next
  store double %div.us.us.1, double* %arrayidx18.us.us.1, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.inc19.us.us, label %for.inc.us.us

for.cond.for.end24_crit_edge.loopexit:            ; preds = %for.inc22.us
  %11 = trunc i64 %indvars.iv.next50 to i32
  br label %for.cond.for.end24_crit_edge

for.cond.for.end24_crit_edge.loopexit44:          ; preds = %for.cond1.preheader.lr.ph
  %k.promoted = load i32, i32* %k, align 4
  %12 = add i32 %i.promoted, 1
  %13 = icmp sgt i32 %0, %12
  %smax = select i1 %13, i32 %0, i32 %12
  br label %for.cond.for.end24_crit_edge

for.cond.for.end24_crit_edge:                     ; preds = %for.cond.for.end24_crit_edge.loopexit44, %for.cond.for.end24_crit_edge.loopexit
  %inc.lcssa8.lcssa14.lcssa = phi i32 [ %0, %for.cond.for.end24_crit_edge.loopexit ], [ %k.promoted, %for.cond.for.end24_crit_edge.loopexit44 ]
  %inc23.lcssa = phi i32 [ %11, %for.cond.for.end24_crit_edge.loopexit ], [ %smax, %for.cond.for.end24_crit_edge.loopexit44 ]
  store i32 %inc23.lcssa, i32* %i, align 4
  store i32 %inc.lcssa8.lcssa14.lcssa, i32* %k, align 4
  br label %for.end24

for.end24:                                        ; preds = %entry, %for.cond.for.end24_crit_edge
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
  %sub10626 = add nsw i32 %n, -1
  %sub11022 = add nsw i32 %n, -1
  %0 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8
  %1 = load i32, i32* %n.addr, align 4
  %2 = sext i32 %1 to i64
  %3 = sext i32 %1 to i64
  %sub110 = add nsw i64 %2, -1
  %sub510 = add nsw i32 %1, -1
  %sub = add nsw i64 %3, -1
  %sub97 = add nsw i32 %1, -1
  %sub5 = add nsw i32 %1, -1
  %4 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8
  %5 = load [120 x [120 x double]]*, [120 x [120 x double]]** %B.addr, align 8
  %t.promoted = load i32, i32* %t, align 4
  %wide.trip.count5 = zext i32 %sub5 to i64
  %wide.trip.count = zext i32 %sub5 to i64
  %wide.trip.count18 = zext i32 %sub15 to i64
  %wide.trip.count24 = zext i32 %sub15 to i64
  %6 = icmp sgt i64 %sub110, 2
  %smax = select i1 %6, i64 %sub110, i64 2
  %7 = add nsw i64 %smax, -1
  %8 = icmp sgt i64 %sub110, 2
  %smax29 = select i1 %8, i64 %sub110, i64 2
  %9 = add nsw i64 %wide.trip.count, -1
  %n.vec = and i64 %7, -2
  %ind.end = or i64 %7, 1
  %n.vec51 = and i64 %9, -2
  %ind.end75 = or i64 %9, 1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc209, %entry
  %inc21049 = phi i32 [ %t.promoted, %entry ], [ %inc210, %for.inc209 ]
  %10 = icmp sgt i32 %sub15, 1
  br i1 %10, label %for.cond4.preheader.preheader, label %for.cond101.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  br label %for.cond4.preheader

for.cond101.preheader:                            ; preds = %for.inc98, %for.cond1.preheader
  %11 = icmp sgt i32 %sub10231, 1
  br i1 %11, label %for.cond105.preheader.preheader, label %for.inc209

for.cond105.preheader.preheader:                  ; preds = %for.cond101.preheader
  br label %for.cond105.preheader

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc98
  %indvar54 = phi i64 [ %indvar.next55, %for.inc98 ], [ 0, %for.cond4.preheader.preheader ]
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %for.inc98 ], [ 1, %for.cond4.preheader.preheader ]
  %12 = icmp sgt i32 %sub510, 1
  %13 = add nuw nsw i64 %indvar54, 1
  %14 = add nuw nsw i64 %indvar54, 2
  br i1 %12, label %for.cond8.preheader.lr.ph, label %for.inc98

for.cond8.preheader.lr.ph:                        ; preds = %for.cond4.preheader
  %15 = icmp sgt i32 %sub97, 1
  %16 = add nuw nsw i64 %indvars.iv7, 1
  %17 = add nsw i64 %indvars.iv7, -1
  br i1 %15, label %for.cond8.preheader.us.preheader, label %for.inc98

for.cond8.preheader.us.preheader:                 ; preds = %for.cond8.preheader.lr.ph
  br label %for.cond8.preheader.us

for.cond8.preheader.us:                           ; preds = %for.cond8.preheader.us.preheader, %for.inc95.us
  %indvar56 = phi i64 [ %indvar.next57, %for.inc95.us ], [ 0, %for.cond8.preheader.us.preheader ]
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc95.us ], [ 1, %for.cond8.preheader.us.preheader ]
  %18 = icmp ult i64 %9, 2
  %19 = add nuw nsw i64 %indvar56, 1
  %scevgep58 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %13, i64 %19, i64 1
  %scevgep60 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %13, i64 %19, i64 %wide.trip.count
  %scevgep62 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %4, i64 %indvar54, i64 %19, i64 1
  %scevgep64 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %4, i64 %14, i64 %19, i64 %wide.trip.count
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %20 = add nsw i64 %indvars.iv2, -1
  br i1 %18, label %for.inc.us.preheader, label %min.iters.checked49

min.iters.checked49:                              ; preds = %for.cond8.preheader.us
  %21 = icmp eq i64 %n.vec51, 0
  br i1 %21, label %for.inc.us.preheader, label %vector.memcheck70

vector.memcheck70:                                ; preds = %min.iters.checked49
  %bound066 = icmp ult double* %scevgep58, %scevgep64
  %bound167 = icmp ult double* %scevgep62, %scevgep60
  %memcheck.conflict69 = and i1 %bound066, %bound167
  br i1 %memcheck.conflict69, label %for.inc.us.preheader, label %vector.body45.preheader

vector.body45.preheader:                          ; preds = %vector.memcheck70
  br label %vector.body45

vector.body45:                                    ; preds = %vector.body45.preheader, %vector.body45
  %index72 = phi i64 [ %index.next73, %vector.body45 ], [ 0, %vector.body45.preheader ]
  %offset.idx77 = or i64 %index72, 1
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %4, i64 %16, i64 %indvars.iv2, i64 %offset.idx77
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %4, i64 %indvars.iv7, i64 %indvars.iv2, i64 %offset.idx77
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = fmul <2 x double> %wide.load82, <double 2.000000e+00, double 2.000000e+00>
  %27 = fsub <2 x double> %wide.load81, %26
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %4, i64 %17, i64 %indvars.iv2, i64 %offset.idx77
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = fadd <2 x double> %27, %wide.load83
  %31 = fmul <2 x double> %30, <double 1.250000e-01, double 1.250000e-01>
  %32 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %4, i64 %indvars.iv7, i64 %indvars.iv.next3, i64 %offset.idx77
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !1
  %34 = bitcast double* %24 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fmul <2 x double> %wide.load85, <double 2.000000e+00, double 2.000000e+00>
  %36 = fsub <2 x double> %wide.load84, %35
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %4, i64 %indvars.iv7, i64 %20, i64 %offset.idx77
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !1
  %39 = fadd <2 x double> %36, %wide.load86
  %40 = fmul <2 x double> %39, <double 1.250000e-01, double 1.250000e-01>
  %41 = fadd <2 x double> %31, %40
  %42 = add nuw nsw i64 %offset.idx77, 1
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %4, i64 %indvars.iv7, i64 %indvars.iv2, i64 %42
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !1
  %45 = bitcast double* %24 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !1
  %46 = fmul <2 x double> %wide.load88, <double 2.000000e+00, double 2.000000e+00>
  %47 = fsub <2 x double> %wide.load87, %46
  %48 = add nsw i64 %offset.idx77, -1
  %49 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %4, i64 %indvars.iv7, i64 %indvars.iv2, i64 %48
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !1
  %51 = fadd <2 x double> %47, %wide.load89
  %52 = fmul <2 x double> %51, <double 1.250000e-01, double 1.250000e-01>
  %53 = fadd <2 x double> %41, %52
  %54 = bitcast double* %24 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !1
  %55 = fadd <2 x double> %53, %wide.load90
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv7, i64 %indvars.iv2, i64 %offset.idx77
  %57 = bitcast double* %56 to <2 x double>*
  store <2 x double> %55, <2 x double>* %57, align 8, !alias.scope !4, !noalias !1
  %index.next73 = add i64 %index72, 2
  %58 = icmp eq i64 %index.next73, %n.vec51
  br i1 %58, label %middle.block46, label %vector.body45, !llvm.loop !6

middle.block46:                                   ; preds = %vector.body45
  %59 = icmp eq i64 %9, %n.vec51
  br i1 %59, label %for.inc95.us, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %middle.block46, %vector.memcheck70, %min.iters.checked49, %for.cond8.preheader.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck70 ], [ 1, %min.iters.checked49 ], [ 1, %for.cond8.preheader.us ], [ %ind.end75, %middle.block46 ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us ], [ %indvars.iv.ph, %for.inc.us.preheader ]
  %arrayidx15.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %4, i64 %16, i64 %indvars.iv2, i64 %indvars.iv
  %60 = load double, double* %arrayidx15.us, align 8
  %arrayidx21.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %4, i64 %indvars.iv7, i64 %indvars.iv2, i64 %indvars.iv
  %61 = load double, double* %arrayidx21.us, align 8
  %mul.us = fmul double %61, 2.000000e+00
  %sub22.us = fsub double %60, %mul.us
  %arrayidx29.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %4, i64 %17, i64 %indvars.iv2, i64 %indvars.iv
  %62 = load double, double* %arrayidx29.us, align 8
  %add30.us = fadd double %sub22.us, %62
  %mul31.us = fmul double %add30.us, 1.250000e-01
  %arrayidx38.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %4, i64 %indvars.iv7, i64 %indvars.iv.next3, i64 %indvars.iv
  %63 = load double, double* %arrayidx38.us, align 8
  %arrayidx44.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %4, i64 %indvars.iv7, i64 %indvars.iv2, i64 %indvars.iv
  %64 = load double, double* %arrayidx44.us, align 8
  %mul45.us = fmul double %64, 2.000000e+00
  %sub46.us = fsub double %63, %mul45.us
  %arrayidx53.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %4, i64 %indvars.iv7, i64 %20, i64 %indvars.iv
  %65 = load double, double* %arrayidx53.us, align 8
  %add54.us = fadd double %sub46.us, %65
  %mul55.us = fmul double %add54.us, 1.250000e-01
  %add56.us = fadd double %mul31.us, %mul55.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %4, i64 %indvars.iv7, i64 %indvars.iv2, i64 %indvars.iv.next
  %66 = load double, double* %arrayidx63.us, align 8
  %arrayidx69.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %4, i64 %indvars.iv7, i64 %indvars.iv2, i64 %indvars.iv
  %67 = load double, double* %arrayidx69.us, align 8
  %mul70.us = fmul double %67, 2.000000e+00
  %sub71.us = fsub double %66, %mul70.us
  %68 = add nsw i64 %indvars.iv, -1
  %arrayidx78.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %4, i64 %indvars.iv7, i64 %indvars.iv2, i64 %68
  %69 = load double, double* %arrayidx78.us, align 8
  %add79.us = fadd double %sub71.us, %69
  %mul80.us = fmul double %add79.us, 1.250000e-01
  %add81.us = fadd double %add56.us, %mul80.us
  %arrayidx87.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %4, i64 %indvars.iv7, i64 %indvars.iv2, i64 %indvars.iv
  %70 = load double, double* %arrayidx87.us, align 8
  %add88.us = fadd double %add81.us, %70
  %arrayidx94.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv7, i64 %indvars.iv2, i64 %indvars.iv
  store double %add88.us, double* %arrayidx94.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc95.us, label %for.inc.us, !llvm.loop !9

for.inc95.us:                                     ; preds = %for.inc.us, %middle.block46
  %exitcond6 = icmp eq i64 %indvars.iv.next3, %wide.trip.count5
  %indvar.next57 = add nuw nsw i64 %indvar56, 1
  br i1 %exitcond6, label %for.inc98, label %for.cond8.preheader.us

for.inc98:                                        ; preds = %for.inc95.us, %for.cond8.preheader.lr.ph, %for.cond4.preheader
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %cmp2 = icmp slt i64 %indvars.iv.next8, %sub
  %indvar.next55 = add nuw nsw i64 %indvar54, 1
  br i1 %cmp2, label %for.cond4.preheader, label %for.cond101.preheader

for.cond105.preheader:                            ; preds = %for.cond105.preheader.preheader, %for.inc206
  %indvar = phi i64 [ %indvar.next, %for.inc206 ], [ 0, %for.cond105.preheader.preheader ]
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %for.inc206 ], [ 1, %for.cond105.preheader.preheader ]
  %71 = icmp sgt i32 %sub10626, 1
  %72 = add nuw nsw i64 %indvar, 1
  %73 = add nuw nsw i64 %indvar, 2
  br i1 %71, label %for.cond109.preheader.lr.ph, label %for.inc206

for.cond109.preheader.lr.ph:                      ; preds = %for.cond105.preheader
  %74 = icmp sgt i32 %sub11022, 1
  %75 = add nuw nsw i64 %indvars.iv20, 1
  %76 = add nsw i64 %indvars.iv20, -1
  br i1 %74, label %for.cond109.preheader.us.preheader, label %for.inc206

for.cond109.preheader.us.preheader:               ; preds = %for.cond109.preheader.lr.ph
  br label %for.cond109.preheader.us

for.cond109.preheader.us:                         ; preds = %for.cond109.preheader.us.preheader, %for.inc203.us
  %indvar26 = phi i64 [ %indvar.next27, %for.inc203.us ], [ 0, %for.cond109.preheader.us.preheader ]
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %for.inc203.us ], [ 1, %for.cond109.preheader.us.preheader ]
  %77 = icmp ult i64 %7, 2
  %78 = add nuw nsw i64 %indvar26, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %72, i64 %78, i64 1
  %scevgep30 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %72, i64 %78, i64 %smax29
  %scevgep32 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvar, i64 %78, i64 1
  %scevgep34 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %73, i64 %78, i64 %smax29
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %79 = add nsw i64 %indvars.iv15, -1
  br i1 %77, label %for.inc200.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond109.preheader.us
  %80 = icmp eq i64 %n.vec, 0
  br i1 %80, label %for.inc200.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep34
  %bound1 = icmp ult double* %scevgep32, %scevgep30
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.inc200.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %81 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %75, i64 %indvars.iv15, i64 %offset.idx
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !10
  %83 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %indvars.iv15, i64 %offset.idx
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load36 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !10
  %85 = fmul <2 x double> %wide.load36, <double 2.000000e+00, double 2.000000e+00>
  %86 = fsub <2 x double> %wide.load, %85
  %87 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %76, i64 %indvars.iv15, i64 %offset.idx
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load37 = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !10
  %89 = fadd <2 x double> %86, %wide.load37
  %90 = fmul <2 x double> %89, <double 1.250000e-01, double 1.250000e-01>
  %91 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %indvars.iv.next16, i64 %offset.idx
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load38 = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !10
  %93 = bitcast double* %83 to <2 x double>*
  %wide.load39 = load <2 x double>, <2 x double>* %93, align 8, !alias.scope !10
  %94 = fmul <2 x double> %wide.load39, <double 2.000000e+00, double 2.000000e+00>
  %95 = fsub <2 x double> %wide.load38, %94
  %96 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %79, i64 %offset.idx
  %97 = bitcast double* %96 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %97, align 8, !alias.scope !10
  %98 = fadd <2 x double> %95, %wide.load40
  %99 = fmul <2 x double> %98, <double 1.250000e-01, double 1.250000e-01>
  %100 = fadd <2 x double> %90, %99
  %101 = add nuw nsw i64 %offset.idx, 1
  %102 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %indvars.iv15, i64 %101
  %103 = bitcast double* %102 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %103, align 8, !alias.scope !10
  %104 = bitcast double* %83 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %104, align 8, !alias.scope !10
  %105 = fmul <2 x double> %wide.load42, <double 2.000000e+00, double 2.000000e+00>
  %106 = fsub <2 x double> %wide.load41, %105
  %107 = add nsw i64 %offset.idx, -1
  %108 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %indvars.iv15, i64 %107
  %109 = bitcast double* %108 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %109, align 8, !alias.scope !10
  %110 = fadd <2 x double> %106, %wide.load43
  %111 = fmul <2 x double> %110, <double 1.250000e-01, double 1.250000e-01>
  %112 = fadd <2 x double> %100, %111
  %113 = bitcast double* %83 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %113, align 8, !alias.scope !10
  %114 = fadd <2 x double> %112, %wide.load44
  %115 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv20, i64 %indvars.iv15, i64 %offset.idx
  %116 = bitcast double* %115 to <2 x double>*
  store <2 x double> %114, <2 x double>* %116, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %117 = icmp eq i64 %index.next, %n.vec
  br i1 %117, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  %118 = icmp eq i64 %7, %n.vec
  br i1 %118, label %for.inc203.us, label %for.inc200.us.preheader

for.inc200.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond109.preheader.us
  %indvars.iv12.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %for.cond109.preheader.us ], [ %ind.end, %middle.block ]
  br label %for.inc200.us

for.inc200.us:                                    ; preds = %for.inc200.us.preheader, %for.inc200.us
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %for.inc200.us ], [ %indvars.iv12.ph, %for.inc200.us.preheader ]
  %arrayidx119.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %75, i64 %indvars.iv15, i64 %indvars.iv12
  %119 = load double, double* %arrayidx119.us, align 8
  %arrayidx125.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %indvars.iv15, i64 %indvars.iv12
  %120 = load double, double* %arrayidx125.us, align 8
  %mul126.us = fmul double %120, 2.000000e+00
  %sub127.us = fsub double %119, %mul126.us
  %arrayidx134.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %76, i64 %indvars.iv15, i64 %indvars.iv12
  %121 = load double, double* %arrayidx134.us, align 8
  %add135.us = fadd double %sub127.us, %121
  %mul136.us = fmul double %add135.us, 1.250000e-01
  %arrayidx143.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %indvars.iv.next16, i64 %indvars.iv12
  %122 = load double, double* %arrayidx143.us, align 8
  %arrayidx149.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %indvars.iv15, i64 %indvars.iv12
  %123 = load double, double* %arrayidx149.us, align 8
  %mul150.us = fmul double %123, 2.000000e+00
  %sub151.us = fsub double %122, %mul150.us
  %arrayidx158.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %79, i64 %indvars.iv12
  %124 = load double, double* %arrayidx158.us, align 8
  %add159.us = fadd double %sub151.us, %124
  %mul160.us = fmul double %add159.us, 1.250000e-01
  %add161.us = fadd double %mul136.us, %mul160.us
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %arrayidx168.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %indvars.iv15, i64 %indvars.iv.next13
  %125 = load double, double* %arrayidx168.us, align 8
  %arrayidx174.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %indvars.iv15, i64 %indvars.iv12
  %126 = load double, double* %arrayidx174.us, align 8
  %mul175.us = fmul double %126, 2.000000e+00
  %sub176.us = fsub double %125, %mul175.us
  %127 = add nsw i64 %indvars.iv12, -1
  %arrayidx183.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %indvars.iv15, i64 %127
  %128 = load double, double* %arrayidx183.us, align 8
  %add184.us = fadd double %sub176.us, %128
  %mul185.us = fmul double %add184.us, 1.250000e-01
  %add186.us = fadd double %add161.us, %mul185.us
  %arrayidx192.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %indvars.iv15, i64 %indvars.iv12
  %129 = load double, double* %arrayidx192.us, align 8
  %add193.us = fadd double %add186.us, %129
  %arrayidx199.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv20, i64 %indvars.iv15, i64 %indvars.iv12
  store double %add193.us, double* %arrayidx199.us, align 8
  %cmp111.us = icmp slt i64 %indvars.iv.next13, %sub110
  br i1 %cmp111.us, label %for.inc200.us, label %for.inc203.us, !llvm.loop !16

for.inc203.us:                                    ; preds = %for.inc200.us, %middle.block
  %exitcond19 = icmp eq i64 %indvars.iv.next16, %wide.trip.count18
  %indvar.next27 = add nuw nsw i64 %indvar26, 1
  br i1 %exitcond19, label %for.inc206, label %for.cond109.preheader.us

for.inc206:                                       ; preds = %for.inc203.us, %for.cond109.preheader.lr.ph, %for.cond105.preheader
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next21, %wide.trip.count24
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond25, label %for.inc209, label %for.cond105.preheader

for.inc209:                                       ; preds = %for.inc206, %for.cond101.preheader
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
  %8 = sext i32 %i.promoted to i64
  br i1 %cmp36, label %for.cond2.preheader.us.preheader, label %for.cond.for.end23_crit_edge.loopexit45

for.cond2.preheader.us.preheader:                 ; preds = %for.cond2.preheader.lr.ph
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.inc21.us, %for.cond2.preheader.us.preheader
  %indvars.iv52 = phi i64 [ %8, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next53, %for.inc21.us ]
  %9 = mul nsw i64 %6, %indvars.iv52
  %10 = trunc i64 %9 to i32
  br label %for.cond5.preheader.us.us

for.inc21.us:                                     ; preds = %for.inc18.us.us
  %indvars.iv.next53 = add nsw i64 %indvars.iv52, 1
  %cmp.us = icmp slt i64 %indvars.iv.next53, %5
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.cond.for.end23_crit_edge.loopexit

for.cond5.preheader.us.us:                        ; preds = %for.inc18.us.us, %for.cond2.preheader.us
  %indvars.iv48 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next49, %for.inc18.us.us ]
  %11 = trunc i64 %indvars.iv48 to i32
  %mul83.us.us = add i32 %10, %11
  %add.us.us = mul i32 %mul83.us.us, %4
  %12 = zext i32 %add.us.us to i64
  br label %for.body7.us.us

for.inc18.us.us:                                  ; preds = %for.inc.us.us
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next49, %wide.trip.count50
  br i1 %exitcond51, label %for.inc21.us, label %for.cond5.preheader.us.us

for.body7.us.us:                                  ; preds = %for.inc.us.us, %for.cond5.preheader.us.us
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader.us.us ], [ %indvars.iv.next, %for.inc.us.us ]
  %13 = add i64 %12, %indvars.iv
  %14 = trunc i64 %13 to i32
  %rem.us.us = srem i32 %14, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %for.inc.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %for.inc.us.us

for.inc.us.us:                                    ; preds = %for.body7.us.us, %if.then.us.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %7, i64 %indvars.iv52, i64 %indvars.iv48, i64 %indvars.iv
  %17 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc18.us.us, label %for.body7.us.us

for.cond.for.end23_crit_edge.loopexit:            ; preds = %for.inc21.us
  %18 = trunc i64 %indvars.iv.next53 to i32
  br label %for.cond.for.end23_crit_edge

for.cond.for.end23_crit_edge.loopexit45:          ; preds = %for.cond2.preheader.lr.ph
  %k.promoted = load i32, i32* %k, align 4
  %19 = add i32 %i.promoted, 1
  %20 = icmp sgt i32 %4, %19
  %smax = select i1 %20, i32 %4, i32 %19
  br label %for.cond.for.end23_crit_edge

for.cond.for.end23_crit_edge:                     ; preds = %for.cond.for.end23_crit_edge.loopexit45, %for.cond.for.end23_crit_edge.loopexit
  %inc.lcssa9.lcssa15.lcssa = phi i32 [ %4, %for.cond.for.end23_crit_edge.loopexit ], [ %k.promoted, %for.cond.for.end23_crit_edge.loopexit45 ]
  %inc22.lcssa = phi i32 [ %18, %for.cond.for.end23_crit_edge.loopexit ], [ %smax, %for.cond.for.end23_crit_edge.loopexit45 ]
  store i32 %inc22.lcssa, i32* %i, align 4
  store i32 %inc.lcssa9.lcssa15.lcssa, i32* %k, align 4
  br label %for.end23

for.end23:                                        ; preds = %entry, %for.cond.for.end23_crit_edge
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
