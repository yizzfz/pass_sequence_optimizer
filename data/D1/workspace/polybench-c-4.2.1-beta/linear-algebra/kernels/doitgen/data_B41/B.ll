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
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*, double*) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph39, label %._crit_edge

.lr.ph39:                                         ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %9 = icmp sgt i32 %2, 0
  %10 = sext i32 %2 to i64
  %11 = sext i32 %1 to i64
  %12 = sext i32 %0 to i64
  %13 = zext i32 %2 to i64
  %xtraiter = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %14 = icmp eq i32 %2, 1
  %15 = add nsw i64 %11, -1
  %16 = add nsw i64 %10, -1
  %xtraiter85 = and i64 %10, 3
  %lcmp.mod86 = icmp eq i64 %xtraiter85, 0
  %17 = icmp ult i64 %16, 3
  %xtraiter83 = and i64 %11, 7
  %lcmp.mod84 = icmp eq i64 %xtraiter83, 0
  %18 = icmp ult i64 %15, 7
  br label %._crit_edge21._crit_edge

._crit_edge21._crit_edge:                         ; preds = %._crit_edge21, %.lr.ph39
  %indvars.iv72 = phi i64 [ 0, %.lr.ph39 ], [ %indvars.iv.next73, %._crit_edge21 ]
  br i1 %8, label %.lr.ph20, label %._crit_edge21

.lr.ph20:                                         ; preds = %._crit_edge21._crit_edge
  br i1 %9, label %.lr.ph20.split.us.preheader, label %.lr.ph20.split.preheader

.lr.ph20.split.preheader:                         ; preds = %.lr.ph20
  br i1 %lcmp.mod84, label %.lr.ph20.split.prol.loopexit, label %.lr.ph20.split.prol.preheader

.lr.ph20.split.prol.preheader:                    ; preds = %.lr.ph20.split.preheader
  br label %.lr.ph20.split.prol

.lr.ph20.split.prol:                              ; preds = %.lr.ph20.split.prol, %.lr.ph20.split.prol.preheader
  %indvars.iv56.prol = phi i64 [ %indvars.iv.next57.prol, %.lr.ph20.split.prol ], [ 0, %.lr.ph20.split.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph20.split.prol ], [ %xtraiter83, %.lr.ph20.split.prol.preheader ]
  %indvars.iv.next57.prol = add nuw nsw i64 %indvars.iv56.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph20.split.prol.loopexit.unr-lcssa, label %.lr.ph20.split.prol, !llvm.loop !1

.lr.ph20.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph20.split.prol
  br label %.lr.ph20.split.prol.loopexit

.lr.ph20.split.prol.loopexit:                     ; preds = %.lr.ph20.split.preheader, %.lr.ph20.split.prol.loopexit.unr-lcssa
  %indvars.iv56.unr = phi i64 [ 0, %.lr.ph20.split.preheader ], [ %indvars.iv.next57.prol, %.lr.ph20.split.prol.loopexit.unr-lcssa ]
  br i1 %18, label %._crit_edge21.loopexit78, label %.lr.ph20.split.preheader.new

.lr.ph20.split.preheader.new:                     ; preds = %.lr.ph20.split.prol.loopexit
  br label %.lr.ph20.split

.lr.ph20.split.us.preheader:                      ; preds = %.lr.ph20
  br label %.lr.ph20.split.us

.lr.ph20.split.us:                                ; preds = %._crit_edge17.us, %.lr.ph20.split.us.preheader
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %._crit_edge17.us ], [ 0, %.lr.ph20.split.us.preheader ]
  %19 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 0
  br label %.lr.ph.us.us

._crit_edge17.us.unr-lcssa:                       ; preds = %.lr.ph16.us
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %.lr.ph16.us.prol.loopexit, %._crit_edge17.us.unr-lcssa
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next71, %11
  br i1 %exitcond81, label %._crit_edge21.loopexit, label %.lr.ph20.split.us

.lr.ph16.us:                                      ; preds = %.lr.ph16.us, %.lr.ph16.us.preheader.new
  %indvars.iv68 = phi i64 [ %indvars.iv68.unr, %.lr.ph16.us.preheader.new ], [ %indvars.iv.next69.3, %.lr.ph16.us ]
  %20 = getelementptr inbounds double, double* %5, i64 %indvars.iv68
  %21 = bitcast double* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 %indvars.iv68
  %24 = bitcast double* %23 to i64*
  store i64 %22, i64* %24, align 8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %25 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next69
  %26 = bitcast double* %25 to i64*
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 %indvars.iv.next69
  %29 = bitcast double* %28 to i64*
  store i64 %27, i64* %29, align 8
  %indvars.iv.next69.1 = add nsw i64 %indvars.iv68, 2
  %30 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next69.1
  %31 = bitcast double* %30 to i64*
  %32 = load i64, i64* %31, align 8
  %33 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 %indvars.iv.next69.1
  %34 = bitcast double* %33 to i64*
  store i64 %32, i64* %34, align 8
  %indvars.iv.next69.2 = add nsw i64 %indvars.iv68, 3
  %35 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next69.2
  %36 = bitcast double* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 %indvars.iv.next69.2
  %39 = bitcast double* %38 to i64*
  store i64 %37, i64* %39, align 8
  %indvars.iv.next69.3 = add nsw i64 %indvars.iv68, 4
  %exitcond80.3 = icmp eq i64 %indvars.iv.next69.3, %10
  br i1 %exitcond80.3, label %._crit_edge17.us.unr-lcssa, label %.lr.ph16.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph20.split.us
  %indvars.iv64 = phi i64 [ 0, %.lr.ph20.split.us ], [ %indvars.iv.next65, %._crit_edge.us.us ]
  %40 = getelementptr inbounds double, double* %5, i64 %indvars.iv64
  store double 0.000000e+00, double* %40, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %41 = load double, double* %19, align 8
  %42 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv64
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = fadd double %44, 0.000000e+00
  store double %45, double* %40, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us, %.prol.preheader
  %46 = phi double [ %45, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv60.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %14, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond = icmp eq i64 %indvars.iv.next65, %13
  br i1 %exitcond, label %.lr.ph16.us.preheader, label %.lr.ph.us.us

.lr.ph16.us.preheader:                            ; preds = %._crit_edge.us.us
  br i1 %lcmp.mod86, label %.lr.ph16.us.prol.loopexit, label %.lr.ph16.us.prol.preheader

.lr.ph16.us.prol.preheader:                       ; preds = %.lr.ph16.us.preheader
  br label %.lr.ph16.us.prol

.lr.ph16.us.prol:                                 ; preds = %.lr.ph16.us.prol, %.lr.ph16.us.prol.preheader
  %indvars.iv68.prol = phi i64 [ %indvars.iv.next69.prol, %.lr.ph16.us.prol ], [ 0, %.lr.ph16.us.prol.preheader ]
  %prol.iter87 = phi i64 [ %prol.iter87.sub, %.lr.ph16.us.prol ], [ %xtraiter85, %.lr.ph16.us.prol.preheader ]
  %47 = getelementptr inbounds double, double* %5, i64 %indvars.iv68.prol
  %48 = bitcast double* %47 to i64*
  %49 = load i64, i64* %48, align 8
  %50 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 %indvars.iv68.prol
  %51 = bitcast double* %50 to i64*
  store i64 %49, i64* %51, align 8
  %indvars.iv.next69.prol = add nuw nsw i64 %indvars.iv68.prol, 1
  %prol.iter87.sub = add i64 %prol.iter87, -1
  %prol.iter87.cmp = icmp eq i64 %prol.iter87.sub, 0
  br i1 %prol.iter87.cmp, label %.lr.ph16.us.prol.loopexit.unr-lcssa, label %.lr.ph16.us.prol, !llvm.loop !3

.lr.ph16.us.prol.loopexit.unr-lcssa:              ; preds = %.lr.ph16.us.prol
  br label %.lr.ph16.us.prol.loopexit

.lr.ph16.us.prol.loopexit:                        ; preds = %.lr.ph16.us.preheader, %.lr.ph16.us.prol.loopexit.unr-lcssa
  %indvars.iv68.unr = phi i64 [ 0, %.lr.ph16.us.preheader ], [ %indvars.iv.next69.prol, %.lr.ph16.us.prol.loopexit.unr-lcssa ]
  br i1 %17, label %._crit_edge17.us, label %.lr.ph16.us.preheader.new

.lr.ph16.us.preheader.new:                        ; preds = %.lr.ph16.us.prol.loopexit
  br label %.lr.ph16.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %52 = phi double [ %64, %.lr.ph.us.us.new ], [ %46, %.lr.ph.us.us.new.preheader ]
  %indvars.iv60 = phi i64 [ %indvars.iv.next61.1, %.lr.ph.us.us.new ], [ %indvars.iv60.unr.ph, %.lr.ph.us.us.new.preheader ]
  %53 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 %indvars.iv60
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv60, i64 %indvars.iv64
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fadd double %57, %52
  store double %58, double* %40, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %59 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 %indvars.iv.next61
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next61, i64 %indvars.iv64
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = fadd double %63, %58
  store double %64, double* %40, align 8
  %indvars.iv.next61.1 = add nuw nsw i64 %indvars.iv60, 2
  %exitcond63.1 = icmp eq i64 %indvars.iv.next61.1, %13
  br i1 %exitcond63.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph20.split:                                   ; preds = %.lr.ph20.split, %.lr.ph20.split.preheader.new
  %indvars.iv56 = phi i64 [ %indvars.iv56.unr, %.lr.ph20.split.preheader.new ], [ %indvars.iv.next57.7, %.lr.ph20.split ]
  %indvars.iv.next57.7 = add nsw i64 %indvars.iv56, 8
  %exitcond79.7 = icmp eq i64 %indvars.iv.next57.7, %11
  br i1 %exitcond79.7, label %._crit_edge21.loopexit78.unr-lcssa, label %.lr.ph20.split

._crit_edge21.loopexit:                           ; preds = %._crit_edge17.us
  br label %._crit_edge21

._crit_edge21.loopexit78.unr-lcssa:               ; preds = %.lr.ph20.split
  br label %._crit_edge21.loopexit78

._crit_edge21.loopexit78:                         ; preds = %.lr.ph20.split.prol.loopexit, %._crit_edge21.loopexit78.unr-lcssa
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit78, %._crit_edge21.loopexit, %._crit_edge21._crit_edge
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next73, %12
  br i1 %exitcond82, label %._crit_edge.loopexit, label %._crit_edge21._crit_edge

._crit_edge.loopexit:                             ; preds = %._crit_edge21
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  tail call fastcc void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*) unnamed_addr #0 {
.lr.ph27:
  br label %.lr.ph27.split.us

.lr.ph27.split.us:                                ; preds = %._crit_edge21.us, %.lr.ph27
  %indvars.iv63 = phi i64 [ 0, %.lr.ph27 ], [ %indvars.iv.next64, %._crit_edge21.us ]
  br label %.lr.ph15.us.us

._crit_edge21.us:                                 ; preds = %._crit_edge16.us.us
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next64, 150
  br i1 %exitcond77, label %.lr.ph8.split.us.preheader, label %.lr.ph27.split.us

.lr.ph8.split.us.preheader:                       ; preds = %._crit_edge21.us
  br label %.lr.ph8.split.us

.lr.ph15.us.us:                                   ; preds = %._crit_edge16.us.us, %.lr.ph27.split.us
  %indvars.iv59 = phi i64 [ 0, %.lr.ph27.split.us ], [ %indvars.iv.next60, %._crit_edge16.us.us ]
  %5 = mul nuw nsw i64 %indvars.iv59, %indvars.iv63
  br label %._crit_edge73

._crit_edge16.us.us:                              ; preds = %._crit_edge73
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next60, 140
  br i1 %exitcond70, label %._crit_edge21.us, label %.lr.ph15.us.us

._crit_edge73:                                    ; preds = %._crit_edge73, %.lr.ph15.us.us
  %indvars.iv55 = phi i64 [ 0, %.lr.ph15.us.us ], [ %indvars.iv.next56.1, %._crit_edge73 ]
  %6 = add nuw nsw i64 %5, %indvars.iv55
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 160
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv63, i64 %indvars.iv59, i64 %indvars.iv55
  %indvars.iv.next56 = or i64 %indvars.iv55, 1
  %11 = add nuw nsw i64 %5, %indvars.iv.next56
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 160
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %9, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.600000e+02, double 1.600000e+02>
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next56.1, 160
  br i1 %exitcond.1, label %._crit_edge16.us.us, label %._crit_edge73

.lr.ph8.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph8.split.us.preheader
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge.us ], [ 0, %.lr.ph8.split.us.preheader ]
  br label %._crit_edge75

._crit_edge75:                                    ; preds = %._crit_edge75, %.lr.ph8.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph8.split.us ], [ %indvars.iv.next.1, %._crit_edge75 ]
  %19 = mul nuw nsw i64 %indvars.iv52, %indvars.iv
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 160
  %22 = sitofp i32 %21 to double
  %23 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %24 = mul nuw nsw i64 %indvars.iv52, %indvars.iv.next
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 160
  %27 = sitofp i32 %26 to double
  %28 = insertelement <2 x double> undef, double %22, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fdiv <2 x double> %29, <double 1.600000e+02, double 1.600000e+02>
  %31 = bitcast double* %23 to <2 x double>*
  store <2 x double> %30, <2 x double>* %31, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond68.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond68.1, label %._crit_edge.us, label %._crit_edge75

._crit_edge.us:                                   ; preds = %._crit_edge75
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next53, 160
  br i1 %exitcond76, label %._crit_edge9, label %.lr.ph8.split.us

._crit_edge9:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]*) unnamed_addr #1 {
.lr.ph12:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph12.split.us

.lr.ph12.split.us:                                ; preds = %._crit_edge6.us, %.lr.ph12
  %indvars.iv39 = phi i64 [ 0, %.lr.ph12 ], [ %indvars.iv.next40, %._crit_edge6.us ]
  %8 = mul nuw nsw i64 %indvars.iv39, 140
  br label %.lr.ph.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next40, 150
  br i1 %exitcond47, label %._crit_edge13, label %.lr.ph12.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph12.split.us
  %indvars.iv35 = phi i64 [ 0, %.lr.ph12.split.us ], [ %indvars.iv.next36, %._crit_edge.us.us ]
  %9 = add nuw nsw i64 %8, %indvars.iv35
  %10 = mul nuw nsw i64 %9, 160
  br label %._crit_edge46

._crit_edge.us.us:                                ; preds = %._crit_edge45
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next36, 140
  br i1 %exitcond42, label %._crit_edge6.us, label %.lr.ph.us.us

._crit_edge46:                                    ; preds = %._crit_edge45, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next, %._crit_edge45 ]
  %11 = add nuw nsw i64 %10, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge45

; <label>:15:                                     ; preds = %._crit_edge46
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge45

._crit_edge45:                                    ; preds = %._crit_edge46, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %._crit_edge.us.us, label %._crit_edge46

._crit_edge13:                                    ; preds = %._crit_edge6.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
