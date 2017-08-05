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
  %2 = load i32, i32* %n, align 4
  %arraydecay = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay2 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 %2, [120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  %3 = load i32, i32* %tsteps, align 4
  %4 = load [120 x [120 x [120 x double]]]*, [120 x [120 x [120 x double]]]** %A, align 8
  %arraydecay3 = getelementptr inbounds [120 x [120 x [120 x double]]], [120 x [120 x [120 x double]]]* %4, i64 0, i64 0
  %5 = load [120 x [120 x [120 x double]]]*, [120 x [120 x [120 x double]]]** %B, align 8
  %arraydecay4 = getelementptr inbounds [120 x [120 x [120 x double]]], [120 x [120 x [120 x double]]]* %5, i64 0, i64 0
  tail call fastcc void @kernel_heat_3d(i32 %3, i32 %2, [120 x [120 x double]]* %arraydecay3, [120 x [120 x double]]* %arraydecay4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %6 = load i32, i32* %argc.addr, align 4
  %cmp = icmp sgt i32 %6, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %7 = load i8**, i8*** %argv.addr, align 8
  %8 = load i8*, i8** %7, align 8
  %strcmpload = load i8, i8* %8, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %9 = load i32, i32* %n, align 4
  %10 = load [120 x [120 x [120 x double]]]*, [120 x [120 x [120 x double]]]** %A, align 8
  %arraydecay6 = getelementptr inbounds [120 x [120 x [120 x double]]], [120 x [120 x [120 x double]]]* %10, i64 0, i64 0
  tail call fastcc void @print_array(i32 %9, [120 x [120 x double]]* %arraydecay6)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  %11 = bitcast [120 x [120 x [120 x double]]]** %A to i8**
  %12 = load i8*, i8** %11, align 8
  tail call void @free(i8* %12) #4
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
  %0 = load i32, i32* %n.addr, align 4
  %cmp26 = icmp sgt i32 %0, 0
  %cmp53 = icmp sgt i32 %0, 0
  %1 = load [120 x [120 x double]]*, [120 x [120 x double]]** %B.addr, align 8
  %2 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8
  %i.promoted = load i32, i32* %i, align 4
  br i1 %cmp26, label %for.cond1.preheader.us.preheader, label %for.cond.for.end24_crit_edge.loopexit47

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %3 = sext i32 %i.promoted to i64
  %4 = sext i32 %0 to i64
  %conv8.us.us = sitofp i32 %0 to double
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count51 = zext i32 %0 to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.inc22.us
  %indvars.iv53 = phi i64 [ %3, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next54, %for.inc22.us ]
  br i1 %cmp53, label %for.cond4.preheader.us.us.preheader, label %for.inc22.us

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  %5 = trunc i64 %indvars.iv53 to i32
  br label %for.cond4.preheader.us.us

for.inc22.us.loopexit:                            ; preds = %for.inc19.us.us
  br label %for.inc22.us

for.inc22.us:                                     ; preds = %for.inc22.us.loopexit, %for.cond1.preheader.us
  %inc.lcssa9.lcssa.us = phi i32 [ 0, %for.cond1.preheader.us ], [ %0, %for.inc22.us.loopexit ]
  %indvars.iv.next54 = add nsw i64 %indvars.iv53, 1
  %cmp.us = icmp slt i64 %indvars.iv.next54, %4
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond.for.end24_crit_edge.loopexit

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.inc19.us.us
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.inc19.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %6 = trunc i64 %indvars.iv49 to i32
  br label %for.inc.us.us

for.inc19.us.us:                                  ; preds = %for.inc.us.us
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next50, %wide.trip.count51
  br i1 %exitcond52, label %for.inc22.us.loopexit, label %for.cond4.preheader.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us, %for.cond4.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us.us ], [ 0, %for.cond4.preheader.us.us ]
  %7 = trunc i64 %indvars.iv to i32
  %add.us.us = sub i32 %0, %7
  %sub.us.us = add i32 %add.us.us, %5
  %add7.us.us = add i32 %sub.us.us, %6
  %conv.us.us = sitofp i32 %add7.us.us to double
  %mul.us.us = fmul double %conv.us.us, 1.000000e+01
  %div.us.us = fdiv double %mul.us.us, %conv8.us.us
  %arrayidx12.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv53, i64 %indvars.iv49, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx12.us.us, align 8
  %arrayidx18.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv53, i64 %indvars.iv49, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx18.us.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc19.us.us, label %for.inc.us.us

for.cond.for.end24_crit_edge.loopexit:            ; preds = %for.inc22.us
  %8 = trunc i64 %indvars.iv.next54 to i32
  br label %for.cond.for.end24_crit_edge

for.cond.for.end24_crit_edge.loopexit47:          ; preds = %for.cond1.preheader.lr.ph
  %k.promoted = load i32, i32* %k, align 4
  %9 = add i32 %i.promoted, 1
  %10 = icmp sgt i32 %0, %9
  %smax = select i1 %10, i32 %0, i32 %9
  br label %for.cond.for.end24_crit_edge

for.cond.for.end24_crit_edge:                     ; preds = %for.cond.for.end24_crit_edge.loopexit47, %for.cond.for.end24_crit_edge.loopexit
  %inc.lcssa9.lcssa15.lcssa = phi i32 [ %inc.lcssa9.lcssa.us, %for.cond.for.end24_crit_edge.loopexit ], [ %k.promoted, %for.cond.for.end24_crit_edge.loopexit47 ]
  %inc23.lcssa = phi i32 [ %8, %for.cond.for.end24_crit_edge.loopexit ], [ %smax, %for.cond.for.end24_crit_edge.loopexit47 ]
  store i32 %inc23.lcssa, i32* %i, align 4
  store i32 %inc.lcssa9.lcssa15.lcssa, i32* %k, align 4
  br label %for.end24

for.end24:                                        ; preds = %for.cond.for.end24_crit_edge, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32 %tsteps, i32 %n, [120 x [120 x double]]* %A, [120 x [120 x double]]* %B) unnamed_addr #2 {
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
  %cmp217 = icmp sgt i32 %sub16, 1
  %sub10233 = add nsw i32 %n, -1
  %cmp10334 = icmp sgt i32 %sub10233, 1
  %0 = load i32, i32* %n.addr, align 4
  %sub10628 = add nsw i32 %0, -1
  %cmp10729 = icmp sgt i32 %sub10628, 1
  %sub102 = add nsw i32 %0, -1
  %sub11023 = add nsw i32 %0, -1
  %cmp11124 = icmp sgt i32 %sub11023, 1
  %sub106 = add nsw i32 %0, -1
  %1 = load [120 x [120 x double]]*, [120 x [120 x double]]** %B.addr, align 8
  %2 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8
  %3 = load i32, i32* %n.addr, align 4
  %sub110 = add nsw i32 %3, -1
  %sub511 = add nsw i32 %3, -1
  %cmp612 = icmp sgt i32 %sub511, 1
  %sub = add nsw i32 %3, -1
  %sub97 = add nsw i32 %3, -1
  %cmp108 = icmp sgt i32 %sub97, 1
  %4 = load i32, i32* %n.addr, align 4
  %sub5 = add nsw i32 %4, -1
  %5 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8
  %6 = load [120 x [120 x double]]*, [120 x [120 x double]]** %B.addr, align 8
  %sub9 = add nsw i32 %4, -1
  %t.promoted = load i32, i32* %t, align 4
  %7 = sext i32 %sub9 to i64
  %8 = sext i32 %sub5 to i64
  %9 = sext i32 %sub to i64
  %10 = sext i32 %sub110 to i64
  %11 = sext i32 %sub102 to i64
  %wide.trip.count = zext i32 %sub106 to i64
  %12 = icmp sgt i64 %10, 2
  %smax = select i1 %12, i64 %10, i64 2
  %13 = add nsw i64 %smax, -1
  %14 = icmp sgt i64 %10, 2
  %smax75 = select i1 %14, i64 %10, i64 2
  %15 = icmp sgt i64 %7, 2
  %smax91 = select i1 %15, i64 %7, i64 2
  %16 = add nsw i64 %smax91, -1
  %17 = icmp sgt i64 %7, 2
  %smax104 = select i1 %17, i64 %7, i64 2
  %min.iters.check = icmp ult i64 %13, 2
  %n.vec = and i64 %13, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %13, 1
  %cmp.n = icmp eq i64 %13, %n.vec
  %min.iters.check92 = icmp ult i64 %16, 2
  %n.vec95 = and i64 %16, -2
  %cmp.zero96 = icmp eq i64 %n.vec95, 0
  %ind.end120 = or i64 %16, 1
  %cmp.n121 = icmp eq i64 %16, %n.vec95
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc209
  %inc21051 = phi i32 [ %t.promoted, %entry ], [ %inc210, %for.inc209 ]
  br i1 %cmp217, label %for.cond4.preheader.preheader, label %for.cond101.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  br label %for.cond4.preheader

for.cond101.preheader.loopexit:                   ; preds = %for.inc98
  br label %for.cond101.preheader

for.cond101.preheader:                            ; preds = %for.cond101.preheader.loopexit, %for.cond1.preheader
  br i1 %cmp10334, label %for.cond105.preheader.preheader, label %for.inc209

for.cond105.preheader.preheader:                  ; preds = %for.cond101.preheader
  br label %for.cond105.preheader

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc98
  %indvar98 = phi i64 [ %indvar.next99, %for.inc98 ], [ 0, %for.cond4.preheader.preheader ]
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.inc98 ], [ 1, %for.cond4.preheader.preheader ]
  %18 = add nuw nsw i64 %indvar98, 1
  %19 = add nuw nsw i64 %indvar98, 2
  br i1 %cmp612, label %for.cond8.preheader.lr.ph, label %for.inc98

for.cond8.preheader.lr.ph:                        ; preds = %for.cond4.preheader
  %20 = add nuw nsw i64 %indvars.iv58, 1
  %21 = add nsw i64 %indvars.iv58, -1
  br i1 %cmp108, label %for.cond8.preheader.us.preheader, label %for.inc98

for.cond8.preheader.us.preheader:                 ; preds = %for.cond8.preheader.lr.ph
  br label %for.cond8.preheader.us

for.cond8.preheader.us:                           ; preds = %for.cond8.preheader.us.preheader, %for.inc95.us
  %indvar100 = phi i64 [ %indvar.next101, %for.inc95.us ], [ 0, %for.cond8.preheader.us.preheader ]
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %for.inc95.us ], [ 1, %for.cond8.preheader.us.preheader ]
  %22 = add nuw nsw i64 %indvar100, 1
  %scevgep102 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %6, i64 %18, i64 %22, i64 1
  %scevgep105 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %6, i64 %18, i64 %22, i64 %smax104
  %scevgep107 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvar98, i64 %22, i64 1
  %scevgep109 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %19, i64 %22, i64 %smax104
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %23 = add nsw i64 %indvars.iv55, -1
  br i1 %min.iters.check92, label %for.inc.us.preheader, label %min.iters.checked93

min.iters.checked93:                              ; preds = %for.cond8.preheader.us
  br i1 %cmp.zero96, label %for.inc.us.preheader, label %vector.memcheck115

vector.memcheck115:                               ; preds = %min.iters.checked93
  %bound0111 = icmp ult double* %scevgep102, %scevgep109
  %bound1112 = icmp ult double* %scevgep107, %scevgep105
  %memcheck.conflict114 = and i1 %bound0111, %bound1112
  br i1 %memcheck.conflict114, label %for.inc.us.preheader, label %vector.body88.preheader

vector.body88.preheader:                          ; preds = %vector.memcheck115
  br label %vector.body88

vector.body88:                                    ; preds = %vector.body88.preheader, %vector.body88
  %index117 = phi i64 [ %index.next118, %vector.body88 ], [ 0, %vector.body88.preheader ]
  %offset.idx122 = or i64 %index117, 1
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %20, i64 %indvars.iv55, i64 %offset.idx122
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load126 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv58, i64 %indvars.iv55, i64 %offset.idx122
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load127 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = fmul <2 x double> %wide.load127, <double 2.000000e+00, double 2.000000e+00>
  %29 = fsub <2 x double> %wide.load126, %28
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %21, i64 %indvars.iv55, i64 %offset.idx122
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load128 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !1
  %32 = fadd <2 x double> %wide.load128, %29
  %33 = fmul <2 x double> %32, <double 1.250000e-01, double 1.250000e-01>
  %34 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv58, i64 %indvars.iv.next56, i64 %offset.idx122
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load129 = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !1
  %36 = fsub <2 x double> %wide.load129, %28
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv58, i64 %23, i64 %offset.idx122
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load130 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !1
  %39 = fadd <2 x double> %36, %wide.load130
  %40 = fmul <2 x double> %39, <double 1.250000e-01, double 1.250000e-01>
  %41 = fadd <2 x double> %33, %40
  %42 = add nuw nsw i64 %offset.idx122, 1
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv58, i64 %indvars.iv55, i64 %42
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load131 = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !1
  %45 = fsub <2 x double> %wide.load131, %28
  %46 = add nsw i64 %offset.idx122, -1
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv58, i64 %indvars.iv55, i64 %46
  %48 = bitcast double* %47 to <2 x double>*
  %wide.load132 = load <2 x double>, <2 x double>* %48, align 8, !alias.scope !1
  %49 = fadd <2 x double> %45, %wide.load132
  %50 = fmul <2 x double> %49, <double 1.250000e-01, double 1.250000e-01>
  %51 = fadd <2 x double> %41, %50
  %52 = fadd <2 x double> %wide.load127, %51
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %6, i64 %indvars.iv58, i64 %indvars.iv55, i64 %offset.idx122
  %54 = bitcast double* %53 to <2 x double>*
  store <2 x double> %52, <2 x double>* %54, align 8, !alias.scope !4, !noalias !1
  %index.next118 = add i64 %index117, 2
  %55 = icmp eq i64 %index.next118, %n.vec95
  br i1 %55, label %middle.block89, label %vector.body88, !llvm.loop !6

middle.block89:                                   ; preds = %vector.body88
  br i1 %cmp.n121, label %for.inc95.us, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %middle.block89, %vector.memcheck115, %min.iters.checked93, %for.cond8.preheader.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck115 ], [ 1, %min.iters.checked93 ], [ 1, %for.cond8.preheader.us ], [ %ind.end120, %middle.block89 ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us ], [ %indvars.iv.ph, %for.inc.us.preheader ]
  %arrayidx15.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %20, i64 %indvars.iv55, i64 %indvars.iv
  %56 = load double, double* %arrayidx15.us, align 8
  %arrayidx21.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv58, i64 %indvars.iv55, i64 %indvars.iv
  %57 = load double, double* %arrayidx21.us, align 8
  %mul.us = fmul double %57, 2.000000e+00
  %sub22.us = fsub double %56, %mul.us
  %arrayidx29.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %21, i64 %indvars.iv55, i64 %indvars.iv
  %58 = load double, double* %arrayidx29.us, align 8
  %add30.us = fadd double %58, %sub22.us
  %mul31.us = fmul double %add30.us, 1.250000e-01
  %arrayidx38.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv58, i64 %indvars.iv.next56, i64 %indvars.iv
  %59 = load double, double* %arrayidx38.us, align 8
  %sub46.us = fsub double %59, %mul.us
  %arrayidx53.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv58, i64 %23, i64 %indvars.iv
  %60 = load double, double* %arrayidx53.us, align 8
  %add54.us = fadd double %sub46.us, %60
  %mul55.us = fmul double %add54.us, 1.250000e-01
  %add56.us = fadd double %mul31.us, %mul55.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv58, i64 %indvars.iv55, i64 %indvars.iv.next
  %61 = load double, double* %arrayidx63.us, align 8
  %sub71.us = fsub double %61, %mul.us
  %62 = add nsw i64 %indvars.iv, -1
  %arrayidx78.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv58, i64 %indvars.iv55, i64 %62
  %63 = load double, double* %arrayidx78.us, align 8
  %add79.us = fadd double %sub71.us, %63
  %mul80.us = fmul double %add79.us, 1.250000e-01
  %add81.us = fadd double %add56.us, %mul80.us
  %add88.us = fadd double %57, %add81.us
  %arrayidx94.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %6, i64 %indvars.iv58, i64 %indvars.iv55, i64 %indvars.iv
  store double %add88.us, double* %arrayidx94.us, align 8
  %cmp10.us = icmp slt i64 %indvars.iv.next, %7
  br i1 %cmp10.us, label %for.inc.us, label %for.inc95.us.loopexit, !llvm.loop !9

for.inc95.us.loopexit:                            ; preds = %for.inc.us
  br label %for.inc95.us

for.inc95.us:                                     ; preds = %for.inc95.us.loopexit, %middle.block89
  %cmp6.us = icmp slt i64 %indvars.iv.next56, %8
  %indvar.next101 = add nuw nsw i64 %indvar100, 1
  br i1 %cmp6.us, label %for.cond8.preheader.us, label %for.inc98.loopexit

for.inc98.loopexit:                               ; preds = %for.inc95.us
  br label %for.inc98

for.inc98:                                        ; preds = %for.inc98.loopexit, %for.cond8.preheader.lr.ph, %for.cond4.preheader
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %cmp2 = icmp slt i64 %indvars.iv.next59, %9
  %indvar.next99 = add nuw nsw i64 %indvar98, 1
  br i1 %cmp2, label %for.cond4.preheader, label %for.cond101.preheader.loopexit

for.cond105.preheader:                            ; preds = %for.cond105.preheader.preheader, %for.inc206
  %indvar = phi i64 [ %indvar.next, %for.inc206 ], [ 0, %for.cond105.preheader.preheader ]
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %for.inc206 ], [ 1, %for.cond105.preheader.preheader ]
  %64 = add nuw nsw i64 %indvar, 1
  %65 = add nuw nsw i64 %indvar, 2
  br i1 %cmp10729, label %for.cond109.preheader.lr.ph, label %for.inc206

for.cond109.preheader.lr.ph:                      ; preds = %for.cond105.preheader
  %66 = add nuw nsw i64 %indvars.iv68, 1
  %67 = add nsw i64 %indvars.iv68, -1
  br i1 %cmp11124, label %for.cond109.preheader.us.preheader, label %for.inc206

for.cond109.preheader.us.preheader:               ; preds = %for.cond109.preheader.lr.ph
  br label %for.cond109.preheader.us

for.cond109.preheader.us:                         ; preds = %for.cond109.preheader.us.preheader, %for.inc203.us
  %indvar72 = phi i64 [ %indvar.next73, %for.inc203.us ], [ 0, %for.cond109.preheader.us.preheader ]
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %for.inc203.us ], [ 1, %for.cond109.preheader.us.preheader ]
  %68 = add nuw nsw i64 %indvar72, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %64, i64 %68, i64 1
  %scevgep76 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %64, i64 %68, i64 %smax75
  %scevgep78 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar, i64 %68, i64 1
  %scevgep80 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %65, i64 %68, i64 %smax75
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %69 = add nsw i64 %indvars.iv65, -1
  br i1 %min.iters.check, label %for.inc200.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond109.preheader.us
  br i1 %cmp.zero, label %for.inc200.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep80
  %bound1 = icmp ult double* %scevgep78, %scevgep76
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.inc200.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %70 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %66, i64 %indvars.iv65, i64 %offset.idx
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !10
  %72 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv68, i64 %indvars.iv65, i64 %offset.idx
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !10
  %74 = fmul <2 x double> %wide.load82, <double 2.000000e+00, double 2.000000e+00>
  %75 = fsub <2 x double> %wide.load, %74
  %76 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %67, i64 %indvars.iv65, i64 %offset.idx
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !10
  %78 = fadd <2 x double> %wide.load83, %75
  %79 = fmul <2 x double> %78, <double 1.250000e-01, double 1.250000e-01>
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv68, i64 %indvars.iv.next66, i64 %offset.idx
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !10
  %82 = fsub <2 x double> %wide.load84, %74
  %83 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv68, i64 %69, i64 %offset.idx
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !10
  %85 = fadd <2 x double> %82, %wide.load85
  %86 = fmul <2 x double> %85, <double 1.250000e-01, double 1.250000e-01>
  %87 = fadd <2 x double> %79, %86
  %88 = add nuw nsw i64 %offset.idx, 1
  %89 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv68, i64 %indvars.iv65, i64 %88
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !10
  %91 = fsub <2 x double> %wide.load86, %74
  %92 = add nsw i64 %offset.idx, -1
  %93 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv68, i64 %indvars.iv65, i64 %92
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !10
  %95 = fadd <2 x double> %91, %wide.load87
  %96 = fmul <2 x double> %95, <double 1.250000e-01, double 1.250000e-01>
  %97 = fadd <2 x double> %87, %96
  %98 = fadd <2 x double> %wide.load82, %97
  %99 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv68, i64 %indvars.iv65, i64 %offset.idx
  %100 = bitcast double* %99 to <2 x double>*
  store <2 x double> %98, <2 x double>* %100, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %101 = icmp eq i64 %index.next, %n.vec
  br i1 %101, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc203.us, label %for.inc200.us.preheader

for.inc200.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond109.preheader.us
  %indvars.iv62.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %for.cond109.preheader.us ], [ %ind.end, %middle.block ]
  br label %for.inc200.us

for.inc200.us:                                    ; preds = %for.inc200.us.preheader, %for.inc200.us
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %for.inc200.us ], [ %indvars.iv62.ph, %for.inc200.us.preheader ]
  %arrayidx119.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %66, i64 %indvars.iv65, i64 %indvars.iv62
  %102 = load double, double* %arrayidx119.us, align 8
  %arrayidx125.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv68, i64 %indvars.iv65, i64 %indvars.iv62
  %103 = load double, double* %arrayidx125.us, align 8
  %mul126.us = fmul double %103, 2.000000e+00
  %sub127.us = fsub double %102, %mul126.us
  %arrayidx134.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %67, i64 %indvars.iv65, i64 %indvars.iv62
  %104 = load double, double* %arrayidx134.us, align 8
  %add135.us = fadd double %104, %sub127.us
  %mul136.us = fmul double %add135.us, 1.250000e-01
  %arrayidx143.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv68, i64 %indvars.iv.next66, i64 %indvars.iv62
  %105 = load double, double* %arrayidx143.us, align 8
  %sub151.us = fsub double %105, %mul126.us
  %arrayidx158.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv68, i64 %69, i64 %indvars.iv62
  %106 = load double, double* %arrayidx158.us, align 8
  %add159.us = fadd double %sub151.us, %106
  %mul160.us = fmul double %add159.us, 1.250000e-01
  %add161.us = fadd double %mul136.us, %mul160.us
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %arrayidx168.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv68, i64 %indvars.iv65, i64 %indvars.iv.next63
  %107 = load double, double* %arrayidx168.us, align 8
  %sub176.us = fsub double %107, %mul126.us
  %108 = add nsw i64 %indvars.iv62, -1
  %arrayidx183.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv68, i64 %indvars.iv65, i64 %108
  %109 = load double, double* %arrayidx183.us, align 8
  %add184.us = fadd double %sub176.us, %109
  %mul185.us = fmul double %add184.us, 1.250000e-01
  %add186.us = fadd double %add161.us, %mul185.us
  %add193.us = fadd double %103, %add186.us
  %arrayidx199.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv68, i64 %indvars.iv65, i64 %indvars.iv62
  store double %add193.us, double* %arrayidx199.us, align 8
  %cmp111.us = icmp slt i64 %indvars.iv.next63, %10
  br i1 %cmp111.us, label %for.inc200.us, label %for.inc203.us.loopexit, !llvm.loop !16

for.inc203.us.loopexit:                           ; preds = %for.inc200.us
  br label %for.inc203.us

for.inc203.us:                                    ; preds = %for.inc203.us.loopexit, %middle.block
  %exitcond = icmp eq i64 %indvars.iv.next66, %wide.trip.count
  %indvar.next73 = add nuw nsw i64 %indvar72, 1
  br i1 %exitcond, label %for.inc206.loopexit, label %for.cond109.preheader.us

for.inc206.loopexit:                              ; preds = %for.inc203.us
  br label %for.inc206

for.inc206:                                       ; preds = %for.inc206.loopexit, %for.cond109.preheader.lr.ph, %for.cond105.preheader
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %cmp103 = icmp slt i64 %indvars.iv.next69, %11
  %indvar.next = add nuw nsw i64 %indvar, 1
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
  %3 = load i32, i32* %n.addr, align 4
  %cmp12 = icmp sgt i32 %3, 0
  br i1 %cmp12, label %for.cond2.preheader.lr.ph, label %for.end23

for.cond2.preheader.lr.ph:                        ; preds = %entry
  %4 = load i32, i32* %n.addr, align 4
  %cmp37 = icmp sgt i32 %4, 0
  %cmp64 = icmp sgt i32 %4, 0
  %5 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8
  %i.promoted = load i32, i32* %i, align 4
  br i1 %cmp37, label %for.cond2.preheader.us.preheader, label %for.cond.for.end23_crit_edge.loopexit49

for.cond2.preheader.us.preheader:                 ; preds = %for.cond2.preheader.lr.ph
  %6 = sext i32 %i.promoted to i64
  %7 = sext i32 %4 to i64
  %8 = sext i32 %4 to i64
  %wide.trip.count = zext i32 %4 to i64
  %wide.trip.count54 = zext i32 %4 to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.preheader.us.preheader, %for.inc21.us
  %indvars.iv56 = phi i64 [ %6, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next57, %for.inc21.us ]
  br i1 %cmp64, label %for.cond5.preheader.lr.ph.split.us.us, label %for.inc21.us

for.inc21.us.loopexit:                            ; preds = %for.inc18.us.us
  br label %for.inc21.us

for.inc21.us:                                     ; preds = %for.inc21.us.loopexit, %for.cond2.preheader.us
  %inc.lcssa10.lcssa.us = phi i32 [ 0, %for.cond2.preheader.us ], [ %4, %for.inc21.us.loopexit ]
  %indvars.iv.next57 = add nsw i64 %indvars.iv56, 1
  %cmp.us = icmp slt i64 %indvars.iv.next57, %7
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.cond.for.end23_crit_edge.loopexit

for.cond5.preheader.us.us:                        ; preds = %for.inc18.us.us, %for.cond5.preheader.lr.ph.split.us.us
  %indvars.iv52 = phi i64 [ 0, %for.cond5.preheader.lr.ph.split.us.us ], [ %indvars.iv.next53, %for.inc18.us.us ]
  %9 = trunc i64 %indvars.iv52 to i32
  %mul83.us.us = add i32 %17, %9
  %add.us.us = mul i32 %mul83.us.us, %4
  %10 = zext i32 %add.us.us to i64
  br label %for.body7.us.us

for.inc18.us.us:                                  ; preds = %for.inc.us.us
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  br i1 %exitcond55, label %for.inc21.us.loopexit, label %for.cond5.preheader.us.us

for.body7.us.us:                                  ; preds = %for.inc.us.us, %for.cond5.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us.us ], [ 0, %for.cond5.preheader.us.us ]
  %11 = add i64 %10, %indvars.iv
  %12 = trunc i64 %11 to i32
  %rem.us.us = srem i32 %12, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %for.inc.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %for.inc.us.us

for.inc.us.us:                                    ; preds = %if.then.us.us, %for.body7.us.us
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv56, i64 %indvars.iv52, i64 %indvars.iv
  %15 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc18.us.us, label %for.body7.us.us

for.cond5.preheader.lr.ph.split.us.us:            ; preds = %for.cond2.preheader.us
  %16 = mul nsw i64 %indvars.iv56, %8
  %17 = trunc i64 %16 to i32
  br label %for.cond5.preheader.us.us

for.cond.for.end23_crit_edge.loopexit:            ; preds = %for.inc21.us
  %18 = trunc i64 %indvars.iv.next57 to i32
  br label %for.cond.for.end23_crit_edge

for.cond.for.end23_crit_edge.loopexit49:          ; preds = %for.cond2.preheader.lr.ph
  %k.promoted = load i32, i32* %k, align 4
  %19 = add i32 %i.promoted, 1
  %20 = icmp sgt i32 %4, %19
  %smax = select i1 %20, i32 %4, i32 %19
  br label %for.cond.for.end23_crit_edge

for.cond.for.end23_crit_edge:                     ; preds = %for.cond.for.end23_crit_edge.loopexit49, %for.cond.for.end23_crit_edge.loopexit
  %inc.lcssa10.lcssa17.lcssa = phi i32 [ %inc.lcssa10.lcssa.us, %for.cond.for.end23_crit_edge.loopexit ], [ %k.promoted, %for.cond.for.end23_crit_edge.loopexit49 ]
  %inc22.lcssa = phi i32 [ %18, %for.cond.for.end23_crit_edge.loopexit ], [ %smax, %for.cond.for.end23_crit_edge.loopexit49 ]
  store i32 %inc22.lcssa, i32* %i, align 4
  store i32 %inc.lcssa10.lcssa17.lcssa, i32* %k, align 4
  br label %for.end23

for.end23:                                        ; preds = %for.cond.for.end23_crit_edge, %entry
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
