; ModuleID = 'A.ll'
source_filename = "doitgen.c"
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
define void @kernel_doitgen(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* %A, [160 x double]* %C4, double* %sum) local_unnamed_addr #0 {
entry:
  %cmp37 = icmp sgt i32 %nr, 0
  br i1 %cmp37, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = zext i32 %np to i64
  %1 = add nsw i64 %0, -1
  %2 = icmp sgt i32 %nq, 0
  %3 = icmp sgt i32 %np, 0
  %xtraiter69 = and i64 %0, 1
  %lcmp.mod70 = icmp eq i64 %xtraiter69, 0
  %4 = icmp eq i64 %1, 0
  %sunkaddr77 = ptrtoint double* %sum to i64
  %sunkaddr = ptrtoint double* %sum to i64
  %xtraiter71 = and i64 %0, 3
  %lcmp.mod72 = icmp eq i64 %xtraiter71, 0
  %5 = icmp ult i64 %1, 3
  %wide.trip.count67 = zext i32 %nq to i64
  %wide.trip.count44 = zext i32 %nq to i64
  %6 = add nsw i64 %wide.trip.count44, -1
  %xtraiter = and i64 %wide.trip.count44, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %7 = icmp ult i64 %6, 7
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.inc42
  %storemerge38 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc43, %for.inc42 ]
  br i1 %2, label %for.cond4.preheader.lr.ph, label %for.inc42

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  %idxprom10 = sext i32 %storemerge38 to i64
  br i1 %3, label %for.cond4.preheader.us.preheader, label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond4.preheader.lr.ph
  br i1 %lcmp.mod, label %for.cond4.preheader.prol.loopexit, label %for.cond4.preheader.prol.preheader

for.cond4.preheader.prol.preheader:               ; preds = %for.cond4.preheader.preheader
  br label %for.cond4.preheader.prol

for.cond4.preheader.prol:                         ; preds = %for.cond4.preheader.prol, %for.cond4.preheader.prol.preheader
  %indvars.iv42.prol = phi i64 [ %indvars.iv.next43.prol, %for.cond4.preheader.prol ], [ 0, %for.cond4.preheader.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.cond4.preheader.prol ], [ %xtraiter, %for.cond4.preheader.prol.preheader ]
  %indvars.iv.next43.prol = add nuw nsw i64 %indvars.iv42.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.cond4.preheader.prol.loopexit.unr-lcssa, label %for.cond4.preheader.prol, !llvm.loop !1

for.cond4.preheader.prol.loopexit.unr-lcssa:      ; preds = %for.cond4.preheader.prol
  br label %for.cond4.preheader.prol.loopexit

for.cond4.preheader.prol.loopexit:                ; preds = %for.cond4.preheader.preheader, %for.cond4.preheader.prol.loopexit.unr-lcssa
  %indvars.iv42.unr = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next43.prol, %for.cond4.preheader.prol.loopexit.unr-lcssa ]
  br i1 %7, label %for.inc42.loopexit83, label %for.cond4.preheader.preheader.new

for.cond4.preheader.preheader.new:                ; preds = %for.cond4.preheader.prol.loopexit
  br label %for.cond4.preheader

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.inc39.us
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %for.inc39.us ], [ 0, %for.cond4.preheader.us.preheader ]
  %arrayidx15.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv65, i64 0
  br label %for.body6.us.us

for.inc39.us.loopexit:                            ; preds = %for.inc36.us
  br label %for.inc39.us

for.inc39.us:                                     ; preds = %for.inc39.us.loopexit, %for.inc36.us.prol.loopexit
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, %wide.trip.count67
  br i1 %exitcond68, label %for.inc42.loopexit, label %for.cond4.preheader.us

for.inc36.us:                                     ; preds = %for.inc36.us.preheader, %for.inc36.us
  %indvars.iv59 = phi i64 [ %indvars.iv.next60.3, %for.inc36.us ], [ %indvars.iv59.unr, %for.inc36.us.preheader ]
  %arrayidx29.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv59
  %8 = bitcast double* %arrayidx29.us to i64*
  %9 = load i64, i64* %8, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv65, i64 %indvars.iv59
  %10 = bitcast double* %arrayidx35.us to i64*
  store i64 %9, i64* %10, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %arrayidx29.us.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next60
  %11 = bitcast double* %arrayidx29.us.1 to i64*
  %12 = load i64, i64* %11, align 8
  %arrayidx35.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv65, i64 %indvars.iv.next60
  %13 = bitcast double* %arrayidx35.us.1 to i64*
  store i64 %12, i64* %13, align 8
  %indvars.iv.next60.1 = add nsw i64 %indvars.iv59, 2
  %arrayidx29.us.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next60.1
  %14 = bitcast double* %arrayidx29.us.2 to i64*
  %15 = load i64, i64* %14, align 8
  %arrayidx35.us.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv65, i64 %indvars.iv.next60.1
  %16 = bitcast double* %arrayidx35.us.2 to i64*
  store i64 %15, i64* %16, align 8
  %indvars.iv.next60.2 = add nsw i64 %indvars.iv59, 3
  %arrayidx29.us.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next60.2
  %17 = bitcast double* %arrayidx29.us.3 to i64*
  %18 = load i64, i64* %17, align 8
  %arrayidx35.us.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv65, i64 %indvars.iv.next60.2
  %19 = bitcast double* %arrayidx35.us.3 to i64*
  store i64 %18, i64* %19, align 8
  %indvars.iv.next60.3 = add nsw i64 %indvars.iv59, 4
  %exitcond62.3 = icmp eq i64 %indvars.iv.next60.3, %0
  br i1 %exitcond62.3, label %for.inc39.us.loopexit, label %for.inc36.us

for.body6.us.us:                                  ; preds = %for.cond4.preheader.us, %for.cond7.for.inc22_crit_edge.us.us
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %for.cond7.for.inc22_crit_edge.us.us ], [ 0, %for.cond4.preheader.us ]
  %arrayidx.us.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv55
  store double 0.000000e+00, double* %arrayidx.us.us, align 8
  br i1 %lcmp.mod70, label %for.inc.us.us.prol.loopexit, label %for.inc.us.us.prol

for.inc.us.us.prol:                               ; preds = %for.body6.us.us
  %20 = load double, double* %arrayidx15.us.us.prol, align 8
  %arrayidx19.us.us.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 0, i64 %indvars.iv55
  %21 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul.us.us.prol = fmul double %20, %21
  %add.us.us.prol = fadd double %mul.us.us.prol, 0.000000e+00
  %sunkaddr74 = shl i64 %indvars.iv55, 3
  %sunkaddr75 = add i64 %sunkaddr, %sunkaddr74
  %sunkaddr76 = inttoptr i64 %sunkaddr75 to double*
  store double %add.us.us.prol, double* %sunkaddr76, align 8
  br label %for.inc.us.us.prol.loopexit

for.inc.us.us.prol.loopexit:                      ; preds = %for.inc.us.us.prol, %for.body6.us.us
  %indvars.iv51.unr.ph = phi i64 [ 1, %for.inc.us.us.prol ], [ 0, %for.body6.us.us ]
  %.unr.ph = phi double [ %add.us.us.prol, %for.inc.us.us.prol ], [ 0.000000e+00, %for.body6.us.us ]
  br i1 %4, label %for.cond7.for.inc22_crit_edge.us.us, label %for.inc.us.us.preheader

for.inc.us.us.preheader:                          ; preds = %for.inc.us.us.prol.loopexit
  %sunkaddr78 = shl i64 %indvars.iv55, 3
  %sunkaddr79 = add i64 %sunkaddr77, %sunkaddr78
  %sunkaddr80 = inttoptr i64 %sunkaddr79 to double*
  br label %for.inc.us.us

for.cond7.for.inc22_crit_edge.us.us.loopexit:     ; preds = %for.inc.us.us
  br label %for.cond7.for.inc22_crit_edge.us.us

for.cond7.for.inc22_crit_edge.us.us:              ; preds = %for.cond7.for.inc22_crit_edge.us.us.loopexit, %for.inc.us.us.prol.loopexit
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, %0
  br i1 %exitcond58, label %for.inc36.lr.ph.us, label %for.body6.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us.preheader, %for.inc.us.us
  %indvars.iv51 = phi i64 [ %indvars.iv.next52.1, %for.inc.us.us ], [ %indvars.iv51.unr.ph, %for.inc.us.us.preheader ]
  %22 = phi double [ %add.us.us.1, %for.inc.us.us ], [ %.unr.ph, %for.inc.us.us.preheader ]
  %arrayidx15.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv65, i64 %indvars.iv51
  %23 = load double, double* %arrayidx15.us.us, align 8
  %arrayidx19.us.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv51, i64 %indvars.iv55
  %24 = load double, double* %arrayidx19.us.us, align 8
  %mul.us.us = fmul double %23, %24
  %add.us.us = fadd double %22, %mul.us.us
  store double %add.us.us, double* %sunkaddr80, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv65, i64 %indvars.iv.next52
  %25 = load double, double* %arrayidx15.us.us.1, align 8
  %arrayidx19.us.us.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv.next52, i64 %indvars.iv55
  %26 = load double, double* %arrayidx19.us.us.1, align 8
  %mul.us.us.1 = fmul double %25, %26
  %add.us.us.1 = fadd double %add.us.us, %mul.us.us.1
  store double %add.us.us.1, double* %sunkaddr80, align 8
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next52.1, %0
  br i1 %exitcond54.1, label %for.cond7.for.inc22_crit_edge.us.us.loopexit, label %for.inc.us.us

for.inc36.lr.ph.us:                               ; preds = %for.cond7.for.inc22_crit_edge.us.us
  br i1 %lcmp.mod72, label %for.inc36.us.prol.loopexit, label %for.inc36.us.prol.preheader

for.inc36.us.prol.preheader:                      ; preds = %for.inc36.lr.ph.us
  br label %for.inc36.us.prol

for.inc36.us.prol:                                ; preds = %for.inc36.us.prol.preheader, %for.inc36.us.prol
  %indvars.iv59.prol = phi i64 [ %indvars.iv.next60.prol, %for.inc36.us.prol ], [ 0, %for.inc36.us.prol.preheader ]
  %prol.iter73 = phi i64 [ %prol.iter73.sub, %for.inc36.us.prol ], [ %xtraiter71, %for.inc36.us.prol.preheader ]
  %arrayidx29.us.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv59.prol
  %27 = bitcast double* %arrayidx29.us.prol to i64*
  %28 = load i64, i64* %27, align 8
  %arrayidx35.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv65, i64 %indvars.iv59.prol
  %29 = bitcast double* %arrayidx35.us.prol to i64*
  store i64 %28, i64* %29, align 8
  %indvars.iv.next60.prol = add nuw nsw i64 %indvars.iv59.prol, 1
  %prol.iter73.sub = add i64 %prol.iter73, -1
  %prol.iter73.cmp = icmp eq i64 %prol.iter73.sub, 0
  br i1 %prol.iter73.cmp, label %for.inc36.us.prol.loopexit.loopexit, label %for.inc36.us.prol, !llvm.loop !3

for.inc36.us.prol.loopexit.loopexit:              ; preds = %for.inc36.us.prol
  br label %for.inc36.us.prol.loopexit

for.inc36.us.prol.loopexit:                       ; preds = %for.inc36.us.prol.loopexit.loopexit, %for.inc36.lr.ph.us
  %indvars.iv59.unr = phi i64 [ 0, %for.inc36.lr.ph.us ], [ %indvars.iv.next60.prol, %for.inc36.us.prol.loopexit.loopexit ]
  br i1 %5, label %for.inc39.us, label %for.inc36.us.preheader

for.inc36.us.preheader:                           ; preds = %for.inc36.us.prol.loopexit
  br label %for.inc36.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader, %for.cond4.preheader.preheader.new
  %indvars.iv42 = phi i64 [ %indvars.iv42.unr, %for.cond4.preheader.preheader.new ], [ %indvars.iv.next43.7, %for.cond4.preheader ]
  %indvars.iv.next43.7 = add nsw i64 %indvars.iv42, 8
  %exitcond45.7 = icmp eq i64 %indvars.iv.next43.7, %wide.trip.count44
  br i1 %exitcond45.7, label %for.inc42.loopexit83.unr-lcssa, label %for.cond4.preheader

for.inc42.loopexit:                               ; preds = %for.inc39.us
  br label %for.inc42

for.inc42.loopexit83.unr-lcssa:                   ; preds = %for.cond4.preheader
  br label %for.inc42.loopexit83

for.inc42.loopexit83:                             ; preds = %for.cond4.preheader.prol.loopexit, %for.inc42.loopexit83.unr-lcssa
  br label %for.inc42

for.inc42:                                        ; preds = %for.inc42.loopexit83, %for.inc42.loopexit, %for.cond1.preheader
  %inc43 = add nsw i32 %storemerge38, 1
  %cmp = icmp slt i32 %inc43, %nr
  br i1 %cmp, label %for.cond1.preheader, label %for.end44.loopexit

for.end44.loopexit:                               ; preds = %for.inc42
  br label %for.end44

for.end44:                                        ; preds = %for.end44.loopexit, %entry
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #3
  %arraydecay = bitcast i8* %call to [140 x [160 x double]]*
  %arraydecay3 = bitcast i8* %call2 to [160 x double]*
  tail call fastcc void @init_array([140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3)
  tail call void (...) @polybench_timer_start() #3
  %arraydecay6 = bitcast i8* %call1 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3, double* %arraydecay6)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array([140 x [160 x double]]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #3
  tail call void @free(i8* %call1) #3
  tail call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]* %A, [160 x double]* %C4) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc15, %entry
  %indvars.iv20 = phi i64 [ 0, %entry ], [ %indvars.iv.next21, %for.inc15 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc12, %for.cond1.preheader
  %indvars.iv16 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next17, %for.inc12 ]
  %0 = mul nuw nsw i64 %indvars.iv16, %indvars.iv20
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.cond4.preheader
  %indvars.iv12 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next13.1, %for.inc ]
  %1 = add nuw nsw i64 %indvars.iv12, %0
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 160
  %conv = sitofp i32 %rem to double
  %arrayidx11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv16, i64 %indvars.iv12
  %indvars.iv.next13 = or i64 %indvars.iv12, 1
  %3 = add nuw nsw i64 %indvars.iv.next13, %0
  %4 = trunc i64 %3 to i32
  %rem.1 = srem i32 %4, 160
  %conv.1 = sitofp i32 %rem.1 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.600000e+02, double 1.600000e+02>
  %5 = bitcast double* %arrayidx11 to <2 x double>*
  store <2 x double> %div, <2 x double>* %5, align 8
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv12, 2
  %exitcond15.1 = icmp eq i64 %indvars.iv.next13.1, 160
  br i1 %exitcond15.1, label %for.inc12, label %for.inc

for.inc12:                                        ; preds = %for.inc
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 140
  br i1 %exitcond19, label %for.inc15, label %for.cond4.preheader

for.inc15:                                        ; preds = %for.inc12
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next21, 150
  br i1 %exitcond22, label %for.cond22.preheader.preheader, label %for.cond1.preheader

for.cond22.preheader.preheader:                   ; preds = %for.inc15
  br label %for.cond22.preheader

for.cond22.preheader:                             ; preds = %for.cond22.preheader.preheader, %for.inc38
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %for.inc38 ], [ 0, %for.cond22.preheader.preheader ]
  br label %for.inc35

for.inc35:                                        ; preds = %for.inc35, %for.cond22.preheader
  %indvars.iv = phi i64 [ 0, %for.cond22.preheader ], [ %indvars.iv.next.1, %for.inc35 ]
  %6 = mul nuw nsw i64 %indvars.iv, %indvars.iv9
  %7 = trunc i64 %6 to i32
  %rem27 = srem i32 %7, 160
  %conv28 = sitofp i32 %rem27 to double
  %arrayidx34 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv9, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv9
  %9 = trunc i64 %8 to i32
  %rem27.1 = srem i32 %9, 160
  %conv28.1 = sitofp i32 %rem27.1 to double
  %div30.v.i0.1 = insertelement <2 x double> undef, double %conv28, i32 0
  %div30.v.i0.2 = insertelement <2 x double> %div30.v.i0.1, double %conv28.1, i32 1
  %div30 = fdiv <2 x double> %div30.v.i0.2, <double 1.600000e+02, double 1.600000e+02>
  %10 = bitcast double* %arrayidx34 to <2 x double>*
  store <2 x double> %div30, <2 x double>* %10, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %for.inc38, label %for.inc35

for.inc38:                                        ; preds = %for.inc35
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 160
  br i1 %exitcond11, label %for.end40, label %for.cond22.preheader

for.end40:                                        ; preds = %for.inc38
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc21, %entry
  %indvars.iv12 = phi i64 [ 0, %entry ], [ %indvars.iv.next13, %for.inc21 ]
  %3 = mul nuw nsw i64 %indvars.iv12, 140
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc18, %for.cond2.preheader
  %indvars.iv7 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next8, %for.inc18 ]
  %4 = add nuw nsw i64 %indvars.iv7, %3
  %5 = mul nuw nsw i64 %4, 160
  br label %for.body7

for.body7:                                        ; preds = %for.inc, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %for.inc ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %rem = srem i32 %7, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #4
  br label %for.inc

for.inc:                                          ; preds = %for.body7, %if.then
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv12, i64 %indvars.iv7, i64 %indvars.iv
  %10 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %for.inc18, label %for.body7

for.inc18:                                        ; preds = %for.inc
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next8, 140
  br i1 %exitcond11, label %for.inc21, label %for.cond5.preheader

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next13, 150
  br i1 %exitcond15, label %for.end23, label %for.cond2.preheader

for.end23:                                        ; preds = %for.inc21
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
