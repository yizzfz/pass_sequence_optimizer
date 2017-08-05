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
define void @kernel_doitgen(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* %A, [160 x double]* %C4, double* %sum) local_unnamed_addr #0 {
entry:
  %cmp23 = icmp sgt i32 %nr, 0
  br i1 %cmp23, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp217 = icmp sgt i32 %nq, 0
  br i1 %cmp217, label %for.cond1.preheader.us.preheader, label %for.end44

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %0 = add i32 %np, -1
  %1 = zext i32 %np to i64
  %2 = and i32 %np, 3
  %3 = add nsw i32 %2, -1
  %4 = zext i32 %3 to i64
  %5 = add nuw nsw i64 %4, 1
  %6 = zext i32 %nq to i64
  %7 = zext i32 %nr to i64
  %xtraiter = and i32 %np, 1
  %8 = icmp sgt i32 %np, 0
  %9 = icmp eq i32 %xtraiter, 0
  %10 = icmp eq i32 %0, 0
  %sunkaddr117 = ptrtoint double* %sum to i64
  %sunkaddr = ptrtoint double* %sum to i64
  %11 = icmp eq i32 %2, 0
  %12 = icmp ult i32 %0, 3
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc42.us, %for.cond1.preheader.us.preheader
  %indvars.iv107 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next108, %for.inc42.us ]
  br i1 %8, label %for.cond4.preheader.us.us.preheader, label %for.inc42.us

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  br label %for.cond4.preheader.us.us

for.inc42.us.loopexit:                            ; preds = %for.inc39.us.us
  br label %for.inc42.us

for.inc42.us:                                     ; preds = %for.inc42.us.loopexit, %for.cond1.preheader.us
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next108, %7
  br i1 %exitcond113, label %for.end44.loopexit, label %for.cond1.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.inc39.us.us
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %for.inc39.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %arrayidx15.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv107, i64 %indvars.iv103, i64 0
  br label %for.body6.us.us

for.inc36.lr.ph.us.us:                            ; preds = %for.inc22.us.us
  br i1 %11, label %for.inc36.us.us.prol.loopexit, label %for.inc36.us.us.prol.preheader

for.inc36.us.us.prol.preheader:                   ; preds = %for.inc36.lr.ph.us.us
  br label %for.inc36.us.us.prol

for.inc36.us.us.prol:                             ; preds = %for.inc36.us.us.prol.preheader, %for.inc36.us.us.prol
  %indvars.iv94.prol = phi i64 [ %indvars.iv.next95.prol, %for.inc36.us.us.prol ], [ 0, %for.inc36.us.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc36.us.us.prol ], [ %2, %for.inc36.us.us.prol.preheader ]
  %arrayidx29.us.us.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv94.prol
  %13 = bitcast double* %arrayidx29.us.us.prol to i64*
  %14 = load i64, i64* %13, align 8
  %arrayidx35.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv107, i64 %indvars.iv103, i64 %indvars.iv94.prol
  %15 = bitcast double* %arrayidx35.us.us.prol to i64*
  store i64 %14, i64* %15, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  %indvars.iv.next95.prol = add nuw nsw i64 %indvars.iv94.prol, 1
  br i1 %prol.iter.cmp, label %for.inc36.us.us.prol.loopexit.loopexit, label %for.inc36.us.us.prol, !llvm.loop !1

for.inc36.us.us.prol.loopexit.loopexit:           ; preds = %for.inc36.us.us.prol
  br label %for.inc36.us.us.prol.loopexit

for.inc36.us.us.prol.loopexit:                    ; preds = %for.inc36.us.us.prol.loopexit.loopexit, %for.inc36.lr.ph.us.us
  %indvars.iv94.unr = phi i64 [ 0, %for.inc36.lr.ph.us.us ], [ %5, %for.inc36.us.us.prol.loopexit.loopexit ]
  br i1 %12, label %for.inc39.us.us, label %for.inc36.us.us.preheader

for.inc36.us.us.preheader:                        ; preds = %for.inc36.us.us.prol.loopexit
  br label %for.inc36.us.us

for.inc39.us.us.loopexit:                         ; preds = %for.inc36.us.us
  br label %for.inc39.us.us

for.inc39.us.us:                                  ; preds = %for.inc39.us.us.loopexit, %for.inc36.us.us.prol.loopexit
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond = icmp eq i64 %indvars.iv.next104, %6
  br i1 %exitcond, label %for.inc42.us.loopexit, label %for.cond4.preheader.us.us

for.body6.us.us:                                  ; preds = %for.inc22.us.us, %for.cond4.preheader.us.us
  %indvars.iv90 = phi i64 [ %indvars.iv.next91, %for.inc22.us.us ], [ 0, %for.cond4.preheader.us.us ]
  %arrayidx.us.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv90
  store double 0.000000e+00, double* %arrayidx.us.us, align 8
  br i1 %9, label %for.inc.us.us.prol.loopexit, label %for.inc.us.us.prol

for.inc.us.us.prol:                               ; preds = %for.body6.us.us
  %16 = load double, double* %arrayidx15.us.us.prol, align 8
  %arrayidx19.us.us.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 0, i64 %indvars.iv90
  %17 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul.us.us.prol = fmul double %16, %17
  %add.us.us.prol = fadd double %mul.us.us.prol, 0.000000e+00
  %sunkaddr114 = mul i64 %indvars.iv90, 8
  %sunkaddr115 = add i64 %sunkaddr, %sunkaddr114
  %sunkaddr116 = inttoptr i64 %sunkaddr115 to double*
  store double %add.us.us.prol, double* %sunkaddr116, align 8
  br label %for.inc.us.us.prol.loopexit

for.inc.us.us.prol.loopexit:                      ; preds = %for.body6.us.us, %for.inc.us.us.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.us.us.prol ], [ 0, %for.body6.us.us ]
  %.unr.ph = phi double [ %add.us.us.prol, %for.inc.us.us.prol ], [ 0.000000e+00, %for.body6.us.us ]
  br i1 %10, label %for.inc22.us.us, label %for.inc.us.us.preheader

for.inc.us.us.preheader:                          ; preds = %for.inc.us.us.prol.loopexit
  %sunkaddr118 = mul i64 %indvars.iv90, 8
  %sunkaddr119 = add i64 %sunkaddr117, %sunkaddr118
  %sunkaddr120 = inttoptr i64 %sunkaddr119 to double*
  br label %for.inc.us.us

for.inc22.us.us.loopexit:                         ; preds = %for.inc.us.us
  br label %for.inc22.us.us

for.inc22.us.us:                                  ; preds = %for.inc22.us.us.loopexit, %for.inc.us.us.prol.loopexit
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %exitcond112 = icmp eq i64 %indvars.iv.next91, %1
  br i1 %exitcond112, label %for.inc36.lr.ph.us.us, label %for.body6.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us.preheader, %for.inc.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc.us.us ], [ %indvars.iv.unr.ph, %for.inc.us.us.preheader ]
  %18 = phi double [ %add.us.us.1, %for.inc.us.us ], [ %.unr.ph, %for.inc.us.us.preheader ]
  %arrayidx15.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv107, i64 %indvars.iv103, i64 %indvars.iv
  %19 = load double, double* %arrayidx15.us.us, align 8
  %arrayidx19.us.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv, i64 %indvars.iv90
  %20 = load double, double* %arrayidx19.us.us, align 8
  %mul.us.us = fmul double %19, %20
  %add.us.us = fadd double %mul.us.us, %18
  store double %add.us.us, double* %sunkaddr120, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv107, i64 %indvars.iv103, i64 %indvars.iv.next
  %21 = load double, double* %arrayidx15.us.us.1, align 8
  %arrayidx19.us.us.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv.next, i64 %indvars.iv90
  %22 = load double, double* %arrayidx19.us.us.1, align 8
  %mul.us.us.1 = fmul double %21, %22
  %add.us.us.1 = fadd double %mul.us.us.1, %add.us.us
  store double %add.us.us.1, double* %sunkaddr120, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %1
  br i1 %exitcond.1, label %for.inc22.us.us.loopexit, label %for.inc.us.us

for.inc36.us.us:                                  ; preds = %for.inc36.us.us.preheader, %for.inc36.us.us
  %indvars.iv94 = phi i64 [ %indvars.iv.next95.3, %for.inc36.us.us ], [ %indvars.iv94.unr, %for.inc36.us.us.preheader ]
  %arrayidx29.us.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv94
  %23 = bitcast double* %arrayidx29.us.us to i64*
  %24 = load i64, i64* %23, align 8
  %arrayidx35.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv107, i64 %indvars.iv103, i64 %indvars.iv94
  %25 = bitcast double* %arrayidx35.us.us to i64*
  store i64 %24, i64* %25, align 8
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %arrayidx29.us.us.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next95
  %26 = bitcast double* %arrayidx29.us.us.1 to i64*
  %27 = load i64, i64* %26, align 8
  %arrayidx35.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv107, i64 %indvars.iv103, i64 %indvars.iv.next95
  %28 = bitcast double* %arrayidx35.us.us.1 to i64*
  store i64 %27, i64* %28, align 8
  %indvars.iv.next95.1 = add nsw i64 %indvars.iv94, 2
  %arrayidx29.us.us.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next95.1
  %29 = bitcast double* %arrayidx29.us.us.2 to i64*
  %30 = load i64, i64* %29, align 8
  %arrayidx35.us.us.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv107, i64 %indvars.iv103, i64 %indvars.iv.next95.1
  %31 = bitcast double* %arrayidx35.us.us.2 to i64*
  store i64 %30, i64* %31, align 8
  %indvars.iv.next95.2 = add nsw i64 %indvars.iv94, 3
  %arrayidx29.us.us.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next95.2
  %32 = bitcast double* %arrayidx29.us.us.3 to i64*
  %33 = load i64, i64* %32, align 8
  %arrayidx35.us.us.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv107, i64 %indvars.iv103, i64 %indvars.iv.next95.2
  %34 = bitcast double* %arrayidx35.us.us.3 to i64*
  store i64 %33, i64* %34, align 8
  %indvars.iv.next95.3 = add nsw i64 %indvars.iv94, 4
  %exitcond97.3 = icmp eq i64 %indvars.iv.next95.3, %1
  br i1 %exitcond97.3, label %for.inc39.us.us.loopexit, label %for.inc36.us.us

for.end44.loopexit:                               ; preds = %for.inc42.us
  br label %for.end44

for.end44:                                        ; preds = %for.end44.loopexit, %for.cond1.preheader.lr.ph, %entry
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #1 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %0 = bitcast i8* %call to [140 x [160 x double]]*
  %arraydecay32 = bitcast i8* %call2 to [160 x double]*
  tail call fastcc void @init_array([140 x [160 x double]]* %0, [160 x double]* %arraydecay32)
  tail call void (...) @polybench_timer_start() #4
  %1 = bitcast i8* %call1 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %0, [160 x double]* %arraydecay32, double* %1)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = bitcast i8* %call to [140 x [160 x double]]*
  tail call fastcc void @print_array([140 x [160 x double]]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]* %A, [160 x double]* %C4) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc12.us.us.for.inc15.us_crit_edge, %entry
  %indvars.iv72 = phi i64 [ 0, %entry ], [ %indvars.iv.next73, %for.inc12.us.us.for.inc15.us_crit_edge ]
  br label %for.cond4.preheader.us.us

for.cond4.preheader.us.us:                        ; preds = %for.inc12.us.us, %for.cond1.preheader.us
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %for.inc12.us.us ], [ 0, %for.cond1.preheader.us ]
  %0 = mul nuw nsw i64 %indvars.iv67, %indvars.iv72
  br label %for.inc.us.us

for.inc12.us.us:                                  ; preds = %for.inc.us.us
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond79 = icmp eq i64 %indvars.iv.next68, 140
  br i1 %exitcond79, label %for.inc12.us.us.for.inc15.us_crit_edge, label %for.cond4.preheader.us.us

for.inc12.us.us.for.inc15.us_crit_edge:           ; preds = %for.inc12.us.us
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next73, 150
  br i1 %exitcond80, label %for.cond22.preheader.preheader, label %for.cond1.preheader.us

for.cond22.preheader.preheader:                   ; preds = %for.inc12.us.us.for.inc15.us_crit_edge
  br label %for.cond22.preheader

for.inc.us.us:                                    ; preds = %for.inc.us.us, %for.cond4.preheader.us.us
  %indvars.iv62 = phi i64 [ 0, %for.cond4.preheader.us.us ], [ %indvars.iv.next63.1, %for.inc.us.us ]
  %1 = add nuw nsw i64 %0, %indvars.iv62
  %2 = trunc i64 %1 to i32
  %rem.us.us = srem i32 %2, 160
  %conv.us.us = sitofp i32 %rem.us.us to double
  %div.us.us = fdiv double %conv.us.us, 1.600000e+02
  %arrayidx11.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv72, i64 %indvars.iv67, i64 %indvars.iv62
  store double %div.us.us, double* %arrayidx11.us.us, align 8
  %indvars.iv.next63 = or i64 %indvars.iv62, 1
  %3 = add nuw nsw i64 %0, %indvars.iv.next63
  %4 = trunc i64 %3 to i32
  %rem.us.us.1 = srem i32 %4, 160
  %conv.us.us.1 = sitofp i32 %rem.us.us.1 to double
  %div.us.us.1 = fdiv double %conv.us.us.1, 1.600000e+02
  %arrayidx11.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv72, i64 %indvars.iv67, i64 %indvars.iv.next63
  store double %div.us.us.1, double* %arrayidx11.us.us.1, align 8
  %indvars.iv.next63.1 = add nsw i64 %indvars.iv62, 2
  %exitcond78.1 = icmp eq i64 %indvars.iv.next63.1, 160
  br i1 %exitcond78.1, label %for.inc12.us.us, label %for.inc.us.us

for.cond22.preheader:                             ; preds = %for.cond22.preheader.preheader, %for.inc38
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %for.inc38 ], [ 0, %for.cond22.preheader.preheader ]
  br label %for.inc35

for.inc35:                                        ; preds = %for.inc35, %for.cond22.preheader
  %indvars.iv = phi i64 [ 0, %for.cond22.preheader ], [ %indvars.iv.next.1, %for.inc35 ]
  %5 = mul nuw nsw i64 %indvars.iv57, %indvars.iv
  %6 = trunc i64 %5 to i32
  %rem27 = srem i32 %6, 160
  %conv28 = sitofp i32 %rem27 to double
  %div30 = fdiv double %conv28, 1.600000e+02
  %arrayidx34 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv57, i64 %indvars.iv
  store double %div30, double* %arrayidx34, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %7 = mul nuw nsw i64 %indvars.iv57, %indvars.iv.next
  %8 = trunc i64 %7 to i32
  %rem27.1 = srem i32 %8, 160
  %conv28.1 = sitofp i32 %rem27.1 to double
  %div30.1 = fdiv double %conv28.1, 1.600000e+02
  %arrayidx34.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv57, i64 %indvars.iv.next
  store double %div30.1, double* %arrayidx34.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond77.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond77.1, label %for.inc38, label %for.inc35

for.inc38:                                        ; preds = %for.inc35
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond = icmp eq i64 %indvars.iv.next58, 160
  br i1 %exitcond, label %for.end40, label %for.cond22.preheader

for.end40:                                        ; preds = %for.inc38
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* %A) unnamed_addr #1 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.inc18.us.us.for.inc21.us_crit_edge, %entry
  %indvars.iv56 = phi i64 [ 0, %entry ], [ %indvars.iv.next57, %for.inc18.us.us.for.inc21.us_crit_edge ]
  %3 = mul nsw i64 %indvars.iv56, 140
  br label %for.cond5.preheader.us.us

for.cond5.preheader.us.us:                        ; preds = %for.inc18.us.us, %for.cond2.preheader.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.inc18.us.us ], [ 0, %for.cond2.preheader.us ]
  %mul83.us.us = add i64 %3, %indvars.iv52
  %add.us.us = mul i64 %mul83.us.us, 160
  br label %for.body7.us.us

for.inc18.us.us:                                  ; preds = %for.inc.us.us
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond = icmp eq i64 %indvars.iv.next53, 140
  br i1 %exitcond, label %for.inc18.us.us.for.inc21.us_crit_edge, label %for.cond5.preheader.us.us

for.inc18.us.us.for.inc21.us_crit_edge:           ; preds = %for.inc18.us.us
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next57, 150
  br i1 %exitcond63, label %for.end23, label %for.cond2.preheader.us

for.body7.us.us:                                  ; preds = %for.inc.us.us, %for.cond5.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us.us ], [ 0, %for.cond5.preheader.us.us ]
  %4 = add i64 %add.us.us, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us.us = srem i32 %5, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %for.inc.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us.us

for.inc.us.us:                                    ; preds = %for.body7.us.us, %if.then.us.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv56, i64 %indvars.iv52, i64 %indvars.iv
  %8 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond62, label %for.inc18.us.us, label %for.body7.us.us

for.end23:                                        ; preds = %for.inc18.us.us.for.inc21.us_crit_edge
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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
