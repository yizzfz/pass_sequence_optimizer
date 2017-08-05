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

; Function Attrs: noinline norecurse nounwind uwtable
define void @kernel_doitgen(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* nocapture %A, [160 x double]* nocapture readonly %C4, double* %sum) local_unnamed_addr #0 {
entry:
  %cmp48 = icmp sgt i32 %nr, 0
  br i1 %cmp48, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = zext i32 %np to i64
  %1 = add nsw i64 %0, -1
  %2 = icmp sgt i32 %nq, 0
  %3 = icmp sgt i32 %np, 0
  %xtraiter97 = and i64 %0, 1
  %lcmp.mod98 = icmp eq i64 %xtraiter97, 0
  %4 = icmp eq i64 %1, 0
  %sunkaddr105 = ptrtoint double* %sum to i64
  %sunkaddr = ptrtoint double* %sum to i64
  %xtraiter99 = and i64 %0, 3
  %lcmp.mod100 = icmp eq i64 %xtraiter99, 0
  %5 = icmp ult i64 %1, 3
  %wide.trip.count93 = zext i32 %nq to i64
  %wide.trip.count = zext i32 %nq to i64
  %wide.trip.count95 = zext i32 %nr to i64
  %6 = add nsw i64 %wide.trip.count, -1
  %xtraiter = and i64 %wide.trip.count, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %7 = icmp ult i64 %6, 7
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc42, %for.cond1.preheader.lr.ph
  %indvars.iv76 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next77, %for.inc42 ]
  br i1 %2, label %for.cond4.preheader.lr.ph, label %for.inc42

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  br i1 %3, label %for.cond4.preheader.us.preheader, label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond4.preheader.lr.ph
  br i1 %lcmp.mod, label %for.cond4.preheader.prol.loopexit, label %for.cond4.preheader.prol.preheader

for.cond4.preheader.prol.preheader:               ; preds = %for.cond4.preheader.preheader
  br label %for.cond4.preheader.prol

for.cond4.preheader.prol:                         ; preds = %for.cond4.preheader.prol, %for.cond4.preheader.prol.preheader
  %prol.iter = phi i64 [ %prol.iter.sub, %for.cond4.preheader.prol ], [ %xtraiter, %for.cond4.preheader.prol.preheader ]
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.cond4.preheader.prol.loopexit.unr-lcssa, label %for.cond4.preheader.prol, !llvm.loop !1

for.cond4.preheader.prol.loopexit.unr-lcssa:      ; preds = %for.cond4.preheader.prol
  br label %for.cond4.preheader.prol.loopexit

for.cond4.preheader.prol.loopexit:                ; preds = %for.cond4.preheader.preheader, %for.cond4.preheader.prol.loopexit.unr-lcssa
  %indvars.iv52.unr = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %xtraiter, %for.cond4.preheader.prol.loopexit.unr-lcssa ]
  br i1 %7, label %for.inc42.loopexit111, label %for.cond4.preheader.preheader.new

for.cond4.preheader.preheader.new:                ; preds = %for.cond4.preheader.prol.loopexit
  br label %for.cond4.preheader

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.inc39.us
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %for.inc39.us ], [ 0, %for.cond4.preheader.us.preheader ]
  %arrayidx15.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv76, i64 %indvars.iv72, i64 0
  br label %for.body6.us.us

for.inc39.us.loopexit:                            ; preds = %for.body27.us
  br label %for.inc39.us

for.inc39.us:                                     ; preds = %for.inc39.us.loopexit, %for.body27.us.prol.loopexit
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next73, %wide.trip.count93
  br i1 %exitcond94, label %for.inc42.loopexit, label %for.cond4.preheader.us

for.body27.us:                                    ; preds = %for.body27.us.preheader, %for.body27.us
  %indvars.iv68 = phi i64 [ %indvars.iv.next69.3, %for.body27.us ], [ %indvars.iv68.unr, %for.body27.us.preheader ]
  %arrayidx29.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv68
  %8 = bitcast double* %arrayidx29.us to i64*
  %9 = load i64, i64* %8, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv76, i64 %indvars.iv72, i64 %indvars.iv68
  %10 = bitcast double* %arrayidx35.us to i64*
  store i64 %9, i64* %10, align 8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %arrayidx29.us.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next69
  %11 = bitcast double* %arrayidx29.us.1 to i64*
  %12 = load i64, i64* %11, align 8
  %arrayidx35.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv76, i64 %indvars.iv72, i64 %indvars.iv.next69
  %13 = bitcast double* %arrayidx35.us.1 to i64*
  store i64 %12, i64* %13, align 8
  %indvars.iv.next69.1 = add nsw i64 %indvars.iv68, 2
  %arrayidx29.us.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next69.1
  %14 = bitcast double* %arrayidx29.us.2 to i64*
  %15 = load i64, i64* %14, align 8
  %arrayidx35.us.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv76, i64 %indvars.iv72, i64 %indvars.iv.next69.1
  %16 = bitcast double* %arrayidx35.us.2 to i64*
  store i64 %15, i64* %16, align 8
  %indvars.iv.next69.2 = add nsw i64 %indvars.iv68, 3
  %arrayidx29.us.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next69.2
  %17 = bitcast double* %arrayidx29.us.3 to i64*
  %18 = load i64, i64* %17, align 8
  %arrayidx35.us.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv76, i64 %indvars.iv72, i64 %indvars.iv.next69.2
  %19 = bitcast double* %arrayidx35.us.3 to i64*
  store i64 %18, i64* %19, align 8
  %indvars.iv.next69.3 = add nuw nsw i64 %indvars.iv68, 4
  %exitcond91.3 = icmp eq i64 %indvars.iv.next69.3, %0
  br i1 %exitcond91.3, label %for.inc39.us.loopexit, label %for.body27.us

for.body6.us.us:                                  ; preds = %for.cond4.preheader.us, %for.cond7.for.inc22_crit_edge.us.us
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %for.cond7.for.inc22_crit_edge.us.us ], [ 0, %for.cond4.preheader.us ]
  %arrayidx.us.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv64
  store double 0.000000e+00, double* %arrayidx.us.us, align 8
  br i1 %lcmp.mod98, label %for.body9.us.us.prol.loopexit, label %for.body9.us.us.prol

for.body9.us.us.prol:                             ; preds = %for.body6.us.us
  %20 = load double, double* %arrayidx15.us.us.prol, align 8
  %arrayidx19.us.us.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 0, i64 %indvars.iv64
  %21 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul.us.us.prol = fmul double %20, %21
  %sunkaddr102 = shl i64 %indvars.iv64, 3
  %sunkaddr103 = add i64 %sunkaddr, %sunkaddr102
  %sunkaddr104 = inttoptr i64 %sunkaddr103 to double*
  %22 = load double, double* %sunkaddr104, align 8
  %add.us.us.prol = fadd double %22, %mul.us.us.prol
  store double %add.us.us.prol, double* %sunkaddr104, align 8
  br label %for.body9.us.us.prol.loopexit

for.body9.us.us.prol.loopexit:                    ; preds = %for.body9.us.us.prol, %for.body6.us.us
  %indvars.iv60.unr.ph = phi i64 [ 1, %for.body9.us.us.prol ], [ 0, %for.body6.us.us ]
  br i1 %4, label %for.cond7.for.inc22_crit_edge.us.us, label %for.body9.us.us.preheader

for.body9.us.us.preheader:                        ; preds = %for.body9.us.us.prol.loopexit
  %sunkaddr106 = shl i64 %indvars.iv64, 3
  %sunkaddr107 = add i64 %sunkaddr105, %sunkaddr106
  %sunkaddr108 = inttoptr i64 %sunkaddr107 to double*
  br label %for.body9.us.us

for.cond7.for.inc22_crit_edge.us.us.loopexit:     ; preds = %for.body9.us.us
  br label %for.cond7.for.inc22_crit_edge.us.us

for.cond7.for.inc22_crit_edge.us.us:              ; preds = %for.cond7.for.inc22_crit_edge.us.us.loopexit, %for.body9.us.us.prol.loopexit
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond89 = icmp eq i64 %indvars.iv.next65, %0
  br i1 %exitcond89, label %for.body27.lr.ph.us, label %for.body6.us.us

for.body9.us.us:                                  ; preds = %for.body9.us.us.preheader, %for.body9.us.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61.1, %for.body9.us.us ], [ %indvars.iv60.unr.ph, %for.body9.us.us.preheader ]
  %arrayidx15.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv76, i64 %indvars.iv72, i64 %indvars.iv60
  %23 = load double, double* %arrayidx15.us.us, align 8
  %arrayidx19.us.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv60, i64 %indvars.iv64
  %24 = load double, double* %arrayidx19.us.us, align 8
  %mul.us.us = fmul double %23, %24
  %25 = load double, double* %sunkaddr108, align 8
  %add.us.us = fadd double %25, %mul.us.us
  store double %add.us.us, double* %sunkaddr108, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv76, i64 %indvars.iv72, i64 %indvars.iv.next61
  %26 = load double, double* %arrayidx15.us.us.1, align 8
  %arrayidx19.us.us.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv.next61, i64 %indvars.iv64
  %27 = load double, double* %arrayidx19.us.us.1, align 8
  %mul.us.us.1 = fmul double %26, %27
  %add.us.us.1 = fadd double %add.us.us, %mul.us.us.1
  store double %add.us.us.1, double* %sunkaddr108, align 8
  %indvars.iv.next61.1 = add nuw nsw i64 %indvars.iv60, 2
  %exitcond87.1 = icmp eq i64 %indvars.iv.next61.1, %0
  br i1 %exitcond87.1, label %for.cond7.for.inc22_crit_edge.us.us.loopexit, label %for.body9.us.us

for.body27.lr.ph.us:                              ; preds = %for.cond7.for.inc22_crit_edge.us.us
  br i1 %lcmp.mod100, label %for.body27.us.prol.loopexit, label %for.body27.us.prol.preheader

for.body27.us.prol.preheader:                     ; preds = %for.body27.lr.ph.us
  br label %for.body27.us.prol

for.body27.us.prol:                               ; preds = %for.body27.us.prol.preheader, %for.body27.us.prol
  %indvars.iv68.prol = phi i64 [ %indvars.iv.next69.prol, %for.body27.us.prol ], [ 0, %for.body27.us.prol.preheader ]
  %prol.iter101 = phi i64 [ %prol.iter101.sub, %for.body27.us.prol ], [ %xtraiter99, %for.body27.us.prol.preheader ]
  %arrayidx29.us.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv68.prol
  %28 = bitcast double* %arrayidx29.us.prol to i64*
  %29 = load i64, i64* %28, align 8
  %arrayidx35.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv76, i64 %indvars.iv72, i64 %indvars.iv68.prol
  %30 = bitcast double* %arrayidx35.us.prol to i64*
  store i64 %29, i64* %30, align 8
  %indvars.iv.next69.prol = add nuw nsw i64 %indvars.iv68.prol, 1
  %prol.iter101.sub = add nsw i64 %prol.iter101, -1
  %prol.iter101.cmp = icmp eq i64 %prol.iter101.sub, 0
  br i1 %prol.iter101.cmp, label %for.body27.us.prol.loopexit.loopexit, label %for.body27.us.prol, !llvm.loop !3

for.body27.us.prol.loopexit.loopexit:             ; preds = %for.body27.us.prol
  br label %for.body27.us.prol.loopexit

for.body27.us.prol.loopexit:                      ; preds = %for.body27.us.prol.loopexit.loopexit, %for.body27.lr.ph.us
  %indvars.iv68.unr = phi i64 [ 0, %for.body27.lr.ph.us ], [ %xtraiter99, %for.body27.us.prol.loopexit.loopexit ]
  br i1 %5, label %for.inc39.us, label %for.body27.us.preheader

for.body27.us.preheader:                          ; preds = %for.body27.us.prol.loopexit
  br label %for.body27.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader, %for.cond4.preheader.preheader.new
  %indvars.iv52 = phi i64 [ %indvars.iv52.unr, %for.cond4.preheader.preheader.new ], [ %indvars.iv.next53.7, %for.cond4.preheader ]
  %indvars.iv.next53.7 = add nuw nsw i64 %indvars.iv52, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next53.7, %wide.trip.count
  br i1 %exitcond.7, label %for.inc42.loopexit111.unr-lcssa, label %for.cond4.preheader

for.inc42.loopexit:                               ; preds = %for.inc39.us
  br label %for.inc42

for.inc42.loopexit111.unr-lcssa:                  ; preds = %for.cond4.preheader
  br label %for.inc42.loopexit111

for.inc42.loopexit111:                            ; preds = %for.cond4.preheader.prol.loopexit, %for.inc42.loopexit111.unr-lcssa
  br label %for.inc42

for.inc42:                                        ; preds = %for.inc42.loopexit111, %for.inc42.loopexit, %for.cond1.preheader
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next77, %wide.trip.count95
  br i1 %exitcond96, label %for.end44.loopexit, label %for.cond1.preheader

for.end44.loopexit:                               ; preds = %for.inc42
  br label %for.end44

for.end44:                                        ; preds = %for.end44.loopexit, %entry
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #1 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %arraydecay = bitcast i8* %call to [140 x [160 x double]]*
  %arraydecay3 = bitcast i8* %call2 to [160 x double]*
  tail call fastcc void @init_array([140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay6 = bitcast i8* %call1 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3, double* %arraydecay6)
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
  tail call fastcc void @print_array([140 x [160 x double]]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]* nocapture %A, [160 x double]* nocapture %C4) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc15, %entry
  %indvars.iv37 = phi i64 [ 0, %entry ], [ %indvars.iv.next38, %for.inc15 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc12, %for.cond1.preheader
  %indvars.iv33 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next34, %for.inc12 ]
  %0 = mul nuw nsw i64 %indvars.iv33, %indvars.iv37
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.cond4.preheader
  %indvars.iv29 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next30.1, %for.body6 ]
  %1 = add nuw nsw i64 %indvars.iv29, %0
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 160
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.600000e+02
  %arrayidx11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv37, i64 %indvars.iv33, i64 %indvars.iv29
  store double %div, double* %arrayidx11, align 8
  %indvars.iv.next30 = or i64 %indvars.iv29, 1
  %3 = add nuw nsw i64 %indvars.iv.next30, %0
  %4 = trunc i64 %3 to i32
  %rem.1 = srem i32 %4, 160
  %conv.1 = sitofp i32 %rem.1 to double
  %div.1 = fdiv double %conv.1, 1.600000e+02
  %arrayidx11.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv37, i64 %indvars.iv33, i64 %indvars.iv.next30
  store double %div.1, double* %arrayidx11.1, align 8
  %indvars.iv.next30.1 = add nuw nsw i64 %indvars.iv29, 2
  %exitcond32.1 = icmp eq i64 %indvars.iv.next30.1, 160
  br i1 %exitcond32.1, label %for.inc12, label %for.body6

for.inc12:                                        ; preds = %for.body6
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, 140
  br i1 %exitcond36, label %for.inc15, label %for.cond4.preheader

for.inc15:                                        ; preds = %for.inc12
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next38, 150
  br i1 %exitcond39, label %for.cond22.preheader.preheader, label %for.cond1.preheader

for.cond22.preheader.preheader:                   ; preds = %for.inc15
  br label %for.cond22.preheader

for.cond22.preheader:                             ; preds = %for.cond22.preheader.preheader, %for.inc38
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %for.inc38 ], [ 0, %for.cond22.preheader.preheader ]
  br label %for.body25

for.body25:                                       ; preds = %for.body25, %for.cond22.preheader
  %indvars.iv = phi i64 [ 0, %for.cond22.preheader ], [ %indvars.iv.next.1, %for.body25 ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv26
  %6 = trunc i64 %5 to i32
  %rem27 = srem i32 %6, 160
  %conv28 = sitofp i32 %rem27 to double
  %div30 = fdiv double %conv28, 1.600000e+02
  %arrayidx34 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv26, i64 %indvars.iv
  store double %div30, double* %arrayidx34, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %7 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv26
  %8 = trunc i64 %7 to i32
  %rem27.1 = srem i32 %8, 160
  %conv28.1 = sitofp i32 %rem27.1 to double
  %div30.1 = fdiv double %conv28.1, 1.600000e+02
  %arrayidx34.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv26, i64 %indvars.iv.next
  store double %div30.1, double* %arrayidx34.1, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %for.inc38, label %for.body25

for.inc38:                                        ; preds = %for.body25
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next27, 160
  br i1 %exitcond28, label %for.end40, label %for.cond22.preheader

for.end40:                                        ; preds = %for.inc38
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* nocapture readonly %A) unnamed_addr #1 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc21, %entry
  %indvars.iv21 = phi i64 [ 0, %entry ], [ %indvars.iv.next22, %for.inc21 ]
  %3 = mul nuw nsw i64 %indvars.iv21, 140
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc18, %for.cond2.preheader
  %indvars.iv16 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next17, %for.inc18 ]
  %4 = add nuw nsw i64 %indvars.iv16, %3
  %5 = mul nuw nsw i64 %4, 160
  br label %for.body7

for.body7:                                        ; preds = %if.end, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %if.end ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %rem = srem i32 %7, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %for.body7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body7
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv21, i64 %indvars.iv16, i64 %indvars.iv
  %10 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %for.inc18, label %for.body7

for.inc18:                                        ; preds = %if.end
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next17, 140
  br i1 %exitcond20, label %for.inc21, label %for.cond5.preheader

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, 150
  br i1 %exitcond24, label %for.end23, label %for.cond2.preheader

for.end23:                                        ; preds = %for.inc21
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
