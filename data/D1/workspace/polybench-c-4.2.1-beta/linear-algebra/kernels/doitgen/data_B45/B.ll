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
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture readonly, double*) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader6.lr.ph, label %._crit_edge

.preheader6.lr.ph:                                ; preds = %6
  %8 = add i32 %2, -1
  %9 = sext i32 %2 to i64
  %10 = sext i32 %0 to i64
  %wide.trip.count63 = zext i32 %2 to i64
  %xtraiter79 = and i32 %2, 3
  %wide.trip.count71 = zext i32 %1 to i64
  %11 = add nsw i32 %xtraiter79, -1
  %12 = zext i32 %11 to i64
  %13 = add nuw nsw i64 %12, 1
  %14 = add nsw i64 %wide.trip.count71, -1
  %15 = icmp sgt i32 %1, 0
  %16 = icmp sgt i32 %2, 0
  %xtraiter86 = and i64 %9, 1
  %lcmp.mod87 = icmp eq i64 %xtraiter86, 0
  %17 = icmp eq i32 %2, 1
  %sunkaddr92 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %18 = icmp eq i32 %xtraiter79, 0
  %19 = icmp ult i32 %8, 3
  %xtraiter = and i64 %wide.trip.count71, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %20 = icmp ult i64 %14, 7
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge18, %.preheader6.lr.ph
  %indvars.iv73 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next74, %._crit_edge18 ]
  br i1 %15, label %.preheader5.lr.ph, label %._crit_edge18

.preheader5.lr.ph:                                ; preds = %.preheader6
  br i1 %16, label %.preheader5.us.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  br i1 %lcmp.mod, label %.preheader5.prol.loopexit, label %.preheader5.prol.preheader

.preheader5.prol.preheader:                       ; preds = %.preheader5.preheader
  br label %.preheader5.prol

.preheader5.prol:                                 ; preds = %.preheader5.prol, %.preheader5.prol.preheader
  %indvars.iv51.prol = phi i64 [ 0, %.preheader5.prol.preheader ], [ %indvars.iv.next52.prol, %.preheader5.prol ]
  %prol.iter = phi i64 [ %xtraiter, %.preheader5.prol.preheader ], [ %prol.iter.sub, %.preheader5.prol ]
  %indvars.iv.next52.prol = add nuw nsw i64 %indvars.iv51.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader5.prol.loopexit.loopexit, label %.preheader5.prol, !llvm.loop !1

.preheader5.prol.loopexit.loopexit:               ; preds = %.preheader5.prol
  br label %.preheader5.prol.loopexit

.preheader5.prol.loopexit:                        ; preds = %.preheader5.prol.loopexit.loopexit, %.preheader5.preheader
  %indvars.iv51.unr = phi i64 [ 0, %.preheader5.preheader ], [ %indvars.iv.next52.prol, %.preheader5.prol.loopexit.loopexit ]
  br i1 %20, label %._crit_edge18, label %.preheader5.preheader.new

.preheader5.preheader.new:                        ; preds = %.preheader5.prol.loopexit
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge16.us, %.preheader5.us.preheader
  %indvars.iv69 = phi i64 [ 0, %.preheader5.us.preheader ], [ %indvars.iv.next70, %._crit_edge16.us ]
  %21 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv73, i64 %indvars.iv69, i64 0
  br label %.lr.ph.us.us

.preheader.us.loopexit:                           ; preds = %._crit_edge.us.us
  br i1 %18, label %.prol.loopexit78, label %.prol.preheader77.preheader

.prol.preheader77.preheader:                      ; preds = %.preheader.us.loopexit
  br label %.prol.preheader77

.prol.preheader77:                                ; preds = %.prol.preheader77, %.prol.preheader77.preheader
  %indvars.iv65.prol = phi i64 [ 0, %.prol.preheader77.preheader ], [ %indvars.iv.next66.prol, %.prol.preheader77 ]
  %prol.iter81 = phi i32 [ %xtraiter79, %.prol.preheader77.preheader ], [ %prol.iter81.sub, %.prol.preheader77 ]
  %22 = getelementptr inbounds double, double* %5, i64 %indvars.iv65.prol
  %23 = bitcast double* %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv73, i64 %indvars.iv69, i64 %indvars.iv65.prol
  %26 = bitcast double* %25 to i64*
  store i64 %24, i64* %26, align 8
  %indvars.iv.next66.prol = add nuw nsw i64 %indvars.iv65.prol, 1
  %prol.iter81.sub = add nsw i32 %prol.iter81, -1
  %prol.iter81.cmp = icmp eq i32 %prol.iter81.sub, 0
  br i1 %prol.iter81.cmp, label %.prol.loopexit78.loopexit, label %.prol.preheader77, !llvm.loop !3

.prol.loopexit78.loopexit:                        ; preds = %.prol.preheader77
  br label %.prol.loopexit78

.prol.loopexit78:                                 ; preds = %.prol.loopexit78.loopexit, %.preheader.us.loopexit
  %indvars.iv65.unr = phi i64 [ 0, %.preheader.us.loopexit ], [ %13, %.prol.loopexit78.loopexit ]
  br i1 %19, label %._crit_edge16.us, label %.lr.ph15.us.new.preheader

.lr.ph15.us.new.preheader:                        ; preds = %.prol.loopexit78
  br label %.lr.ph15.us.new

.lr.ph15.us.new:                                  ; preds = %.lr.ph15.us.new, %.lr.ph15.us.new.preheader
  %indvars.iv65 = phi i64 [ %indvars.iv65.unr, %.lr.ph15.us.new.preheader ], [ %indvars.iv.next66.3, %.lr.ph15.us.new ]
  %27 = getelementptr inbounds double, double* %5, i64 %indvars.iv65
  %28 = bitcast double* %27 to i64*
  %29 = load i64, i64* %28, align 8
  %30 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv73, i64 %indvars.iv69, i64 %indvars.iv65
  %31 = bitcast double* %30 to i64*
  store i64 %29, i64* %31, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %32 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next66
  %33 = bitcast double* %32 to i64*
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv73, i64 %indvars.iv69, i64 %indvars.iv.next66
  %36 = bitcast double* %35 to i64*
  store i64 %34, i64* %36, align 8
  %indvars.iv.next66.1 = add nsw i64 %indvars.iv65, 2
  %37 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next66.1
  %38 = bitcast double* %37 to i64*
  %39 = load i64, i64* %38, align 8
  %40 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv73, i64 %indvars.iv69, i64 %indvars.iv.next66.1
  %41 = bitcast double* %40 to i64*
  store i64 %39, i64* %41, align 8
  %indvars.iv.next66.2 = add nsw i64 %indvars.iv65, 3
  %42 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next66.2
  %43 = bitcast double* %42 to i64*
  %44 = load i64, i64* %43, align 8
  %45 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv73, i64 %indvars.iv69, i64 %indvars.iv.next66.2
  %46 = bitcast double* %45 to i64*
  store i64 %44, i64* %46, align 8
  %indvars.iv.next66.3 = add nsw i64 %indvars.iv65, 4
  %exitcond68.3 = icmp eq i64 %indvars.iv.next66.3, %wide.trip.count63
  br i1 %exitcond68.3, label %._crit_edge16.us.loopexit, label %.lr.ph15.us.new

._crit_edge16.us.loopexit:                        ; preds = %.lr.ph15.us.new
  br label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %._crit_edge16.us.loopexit, %.prol.loopexit78
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next70, %wide.trip.count71
  br i1 %exitcond72, label %._crit_edge18.loopexit, label %.preheader5.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.preheader5.us
  %indvars.iv61 = phi i64 [ 0, %.preheader5.us ], [ %indvars.iv.next62, %._crit_edge.us.us ]
  %47 = getelementptr inbounds double, double* %5, i64 %indvars.iv61
  store double 0.000000e+00, double* %47, align 8
  br i1 %lcmp.mod87, label %.prol.loopexit, label %48

; <label>:48:                                     ; preds = %.lr.ph.us.us
  %49 = load double, double* %21, align 8
  %50 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv61
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fadd double %52, 0.000000e+00
  %sunkaddr89 = mul i64 %indvars.iv61, 8
  %sunkaddr90 = add i64 %sunkaddr, %sunkaddr89
  %sunkaddr91 = inttoptr i64 %sunkaddr90 to double*
  store double %53, double* %sunkaddr91, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %48, %.lr.ph.us.us
  %.unr.ph = phi double [ %53, %48 ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv59.unr.ph = phi i64 [ 1, %48 ], [ 0, %.lr.ph.us.us ]
  br i1 %17, label %._crit_edge.us.us, label %.lr.ph.us.us.new

.lr.ph.us.us.new:                                 ; preds = %.prol.loopexit
  %sunkaddr93 = mul i64 %indvars.iv61, 8
  %sunkaddr94 = add i64 %sunkaddr92, %sunkaddr93
  %sunkaddr95 = inttoptr i64 %sunkaddr94 to double*
  br label %54

._crit_edge.us.us.loopexit:                       ; preds = %54
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count63
  br i1 %exitcond64, label %.preheader.us.loopexit, label %.lr.ph.us.us

; <label>:54:                                     ; preds = %54, %.lr.ph.us.us.new
  %55 = phi double [ %.unr.ph, %.lr.ph.us.us.new ], [ %67, %54 ]
  %indvars.iv59 = phi i64 [ %indvars.iv59.unr.ph, %.lr.ph.us.us.new ], [ %indvars.iv.next60.1, %54 ]
  %56 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv73, i64 %indvars.iv69, i64 %indvars.iv59
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv59, i64 %indvars.iv61
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fadd double %60, %55
  store double %61, double* %sunkaddr95, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %62 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv73, i64 %indvars.iv69, i64 %indvars.iv.next60
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next60, i64 %indvars.iv61
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fadd double %66, %61
  store double %67, double* %sunkaddr95, align 8
  %indvars.iv.next60.1 = add nsw i64 %indvars.iv59, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next60.1, %9
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %54

.preheader5:                                      ; preds = %.preheader5, %.preheader5.preheader.new
  %indvars.iv51 = phi i64 [ %indvars.iv51.unr, %.preheader5.preheader.new ], [ %indvars.iv.next52.7, %.preheader5 ]
  %indvars.iv.next52.7 = add nsw i64 %indvars.iv51, 8
  %exitcond54.7 = icmp eq i64 %indvars.iv.next52.7, %wide.trip.count71
  br i1 %exitcond54.7, label %._crit_edge18.loopexit96, label %.preheader5

._crit_edge18.loopexit:                           ; preds = %._crit_edge16.us
  br label %._crit_edge18

._crit_edge18.loopexit96:                         ; preds = %.preheader5
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit96, %._crit_edge18.loopexit, %.preheader5.prol.loopexit, %.preheader6
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next74, %10
  br i1 %exitcond85, label %._crit_edge.loopexit, label %.preheader6

._crit_edge.loopexit:                             ; preds = %._crit_edge18
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #1 {
  %3 = call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  call fastcc void @init_array([140 x [160 x double]]* %6, [160 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to double*
  call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7, double* %8)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to [140 x [160 x double]]*
  call fastcc void @print_array([140 x [160 x double]]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]* nocapture, [160 x double]* nocapture) unnamed_addr #0 {
.preheader7.lr.ph:
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge16.us.us.._crit_edge19.us_crit_edge, %.preheader7.lr.ph
  %indvars.iv59 = phi i64 [ 0, %.preheader7.lr.ph ], [ %indvars.iv.next60, %._crit_edge16.us.us.._crit_edge19.us_crit_edge ]
  br label %.preheader6.us.us

.preheader6.us.us:                                ; preds = %._crit_edge16.us.us, %.preheader7.us
  %indvars.iv55 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next56, %._crit_edge16.us.us ]
  %2 = mul nuw nsw i64 %indvars.iv55, %indvars.iv59
  br label %3

._crit_edge16.us.us:                              ; preds = %3
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, 140
  br i1 %exitcond58, label %._crit_edge16.us.us.._crit_edge19.us_crit_edge, label %.preheader6.us.us

._crit_edge16.us.us.._crit_edge19.us_crit_edge:   ; preds = %._crit_edge16.us.us
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next60, 150
  br i1 %exitcond2, label %.preheader.us.preheader, label %.preheader7.us

.preheader.us.preheader:                          ; preds = %._crit_edge16.us.us.._crit_edge19.us_crit_edge
  br label %.preheader.us

; <label>:3:                                      ; preds = %3, %.preheader6.us.us
  %indvars.iv51 = phi i64 [ 0, %.preheader6.us.us ], [ %indvars.iv.next52.1, %3 ]
  %4 = add nuw nsw i64 %2, %indvars.iv51
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 160
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv59, i64 %indvars.iv55, i64 %indvars.iv51
  %indvars.iv.next52 = or i64 %indvars.iv51, 1
  %9 = add nuw nsw i64 %2, %indvars.iv.next52
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 160
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %7, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 1.600000e+02, double 1.600000e+02>
  %16 = bitcast double* %8 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next52.1, 160
  br i1 %exitcond54.1, label %._crit_edge16.us.us, label %3

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv48 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next49, %._crit_edge.us ]
  br label %17

; <label>:17:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %17 ]
  %18 = mul nuw nsw i64 %indvars.iv48, %indvars.iv
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 160
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds [160 x double], [160 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %23 = mul nuw nsw i64 %indvars.iv48, %indvars.iv.next
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 160
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %21, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fdiv <2 x double> %28, <double 1.600000e+02, double 1.600000e+02>
  %30 = bitcast double* %22 to <2 x double>*
  store <2 x double> %29, <2 x double>* %30, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.us, label %17

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next49, 160
  br i1 %exitcond1, label %._crit_edge10.loopexit, label %.preheader.us

._crit_edge10.loopexit:                           ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* nocapture readonly) unnamed_addr #1 {
.preheader3.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge5.us.us.._crit_edge6.us_crit_edge, %.preheader3.lr.ph
  %indvars.iv39 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next40, %._crit_edge5.us.us.._crit_edge6.us_crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv39, 140
  br label %.preheader.us.us

.preheader.us.us:                                 ; preds = %._crit_edge5.us.us, %.preheader3.us
  %indvars.iv35 = phi i64 [ 0, %.preheader3.us ], [ %indvars.iv.next36, %._crit_edge5.us.us ]
  %6 = add nuw nsw i64 %5, %indvars.iv35
  %7 = mul nuw nsw i64 %6, 160
  br label %8

._crit_edge5.us.us:                               ; preds = %._crit_edge.us.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 140
  br i1 %exitcond38, label %._crit_edge5.us.us.._crit_edge6.us_crit_edge, label %.preheader.us.us

._crit_edge5.us.us.._crit_edge6.us_crit_edge:     ; preds = %._crit_edge5.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond = icmp eq i64 %indvars.iv.next40, 150
  br i1 %exitcond, label %._crit_edge11, label %.preheader3.us

; <label>:8:                                      ; preds = %._crit_edge.us.us, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next, %._crit_edge.us.us ]
  %9 = add nuw nsw i64 %7, %indvars.iv
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge.us.us

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %8, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond34, label %._crit_edge5.us.us, label %8

._crit_edge11:                                    ; preds = %._crit_edge5.us.us.._crit_edge6.us_crit_edge
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
