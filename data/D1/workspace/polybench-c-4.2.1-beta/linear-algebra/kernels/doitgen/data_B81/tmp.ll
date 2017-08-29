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
  br i1 %7, label %.lr.ph22, label %._crit_edge23

.lr.ph22:                                         ; preds = %6
  %8 = add i32 %2, -1
  %9 = sext i32 %0 to i64
  %xtraiter76 = and i32 %2, 1
  %wide.trip.count61 = zext i32 %2 to i64
  %xtraiter81 = and i32 %2, 3
  %wide.trip.count69 = zext i32 %1 to i64
  %10 = add nsw i32 %xtraiter81, -1
  %11 = zext i32 %10 to i64
  %12 = add nuw nsw i64 %11, 1
  %13 = add nsw i64 %wide.trip.count69, -1
  %xtraiter = and i64 %wide.trip.count69, 7
  br label %14

; <label>:14:                                     ; preds = %._crit_edge14, %.lr.ph22
  %indvars.iv71 = phi i64 [ 0, %.lr.ph22 ], [ %indvars.iv.next72, %._crit_edge14 ]
  %15 = icmp sgt i32 %1, 0
  br i1 %15, label %.lr.ph13, label %._crit_edge14

.lr.ph13:                                         ; preds = %14
  %16 = icmp sgt i32 %2, 0
  br i1 %16, label %.lr.ph13.split.us.preheader, label %.lr.ph13.split.preheader

.lr.ph13.split.preheader:                         ; preds = %.lr.ph13
  %17 = icmp eq i64 %xtraiter, 0
  br i1 %17, label %.lr.ph13.split.prol.loopexit, label %.lr.ph13.split.prol.preheader

.lr.ph13.split.prol.preheader:                    ; preds = %.lr.ph13.split.preheader
  br label %.lr.ph13.split.prol

.lr.ph13.split.prol:                              ; preds = %.lr.ph13.split.prol, %.lr.ph13.split.prol.preheader
  %indvars.iv47.prol = phi i64 [ %indvars.iv.next48.prol, %.lr.ph13.split.prol ], [ 0, %.lr.ph13.split.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph13.split.prol ], [ %xtraiter, %.lr.ph13.split.prol.preheader ]
  %indvars.iv.next48.prol = add nuw nsw i64 %indvars.iv47.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph13.split.prol.loopexit.loopexit, label %.lr.ph13.split.prol, !llvm.loop !1

.lr.ph13.split.prol.loopexit.loopexit:            ; preds = %.lr.ph13.split.prol
  br label %.lr.ph13.split.prol.loopexit

.lr.ph13.split.prol.loopexit:                     ; preds = %.lr.ph13.split.prol.loopexit.loopexit, %.lr.ph13.split.preheader
  %indvars.iv47.unr = phi i64 [ 0, %.lr.ph13.split.preheader ], [ %indvars.iv.next48.prol, %.lr.ph13.split.prol.loopexit.loopexit ]
  %18 = icmp ult i64 %13, 7
  br i1 %18, label %._crit_edge14, label %.lr.ph13.split.preheader.new

.lr.ph13.split.preheader.new:                     ; preds = %.lr.ph13.split.prol.loopexit
  br label %.lr.ph13.split

.lr.ph13.split.us.preheader:                      ; preds = %.lr.ph13
  br label %.lr.ph13.split.us

.lr.ph13.split.us:                                ; preds = %.lr.ph13.split.us.preheader, %._crit_edge10.us
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %._crit_edge10.us ], [ 0, %.lr.ph13.split.us.preheader ]
  %19 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 0
  br label %.lr.ph.us.us

.lr.ph9.us:                                       ; preds = %._crit_edge.us.us
  %20 = icmp eq i32 %xtraiter81, 0
  br i1 %20, label %.prol.loopexit80, label %.prol.preheader79.preheader

.prol.preheader79.preheader:                      ; preds = %.lr.ph9.us
  br label %.prol.preheader79

.prol.preheader79:                                ; preds = %.prol.preheader79.preheader, %.prol.preheader79
  %indvars.iv63.prol = phi i64 [ %indvars.iv.next64.prol, %.prol.preheader79 ], [ 0, %.prol.preheader79.preheader ]
  %prol.iter83 = phi i32 [ %prol.iter83.sub, %.prol.preheader79 ], [ %xtraiter81, %.prol.preheader79.preheader ]
  %21 = getelementptr inbounds double, double* %5, i64 %indvars.iv63.prol
  %22 = bitcast double* %21 to i64*
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv63.prol
  %25 = bitcast double* %24 to i64*
  store i64 %23, i64* %25, align 8
  %indvars.iv.next64.prol = add nuw nsw i64 %indvars.iv63.prol, 1
  %prol.iter83.sub = add nsw i32 %prol.iter83, -1
  %prol.iter83.cmp = icmp eq i32 %prol.iter83.sub, 0
  br i1 %prol.iter83.cmp, label %.prol.loopexit80.loopexit, label %.prol.preheader79, !llvm.loop !3

.prol.loopexit80.loopexit:                        ; preds = %.prol.preheader79
  br label %.prol.loopexit80

.prol.loopexit80:                                 ; preds = %.prol.loopexit80.loopexit, %.lr.ph9.us
  %indvars.iv63.unr = phi i64 [ 0, %.lr.ph9.us ], [ %12, %.prol.loopexit80.loopexit ]
  %26 = icmp ult i32 %8, 3
  br i1 %26, label %._crit_edge10.us, label %.lr.ph9.us.new.preheader

.lr.ph9.us.new.preheader:                         ; preds = %.prol.loopexit80
  br label %.lr.ph9.us.new

.lr.ph9.us.new:                                   ; preds = %.lr.ph9.us.new.preheader, %.lr.ph9.us.new
  %indvars.iv63 = phi i64 [ %indvars.iv.next64.3, %.lr.ph9.us.new ], [ %indvars.iv63.unr, %.lr.ph9.us.new.preheader ]
  %27 = getelementptr inbounds double, double* %5, i64 %indvars.iv63
  %28 = bitcast double* %27 to i64*
  %29 = load i64, i64* %28, align 8
  %30 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv63
  %31 = bitcast double* %30 to i64*
  store i64 %29, i64* %31, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %32 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next64
  %33 = bitcast double* %32 to i64*
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv.next64
  %36 = bitcast double* %35 to i64*
  store i64 %34, i64* %36, align 8
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv63, 2
  %37 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next64.1
  %38 = bitcast double* %37 to i64*
  %39 = load i64, i64* %38, align 8
  %40 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv.next64.1
  %41 = bitcast double* %40 to i64*
  store i64 %39, i64* %41, align 8
  %indvars.iv.next64.2 = add nsw i64 %indvars.iv63, 3
  %42 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next64.2
  %43 = bitcast double* %42 to i64*
  %44 = load i64, i64* %43, align 8
  %45 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv.next64.2
  %46 = bitcast double* %45 to i64*
  store i64 %44, i64* %46, align 8
  %indvars.iv.next64.3 = add nsw i64 %indvars.iv63, 4
  %exitcond66.3 = icmp eq i64 %indvars.iv.next64.3, %wide.trip.count61
  br i1 %exitcond66.3, label %._crit_edge10.us.loopexit, label %.lr.ph9.us.new

._crit_edge10.us.loopexit:                        ; preds = %.lr.ph9.us.new
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge10.us.loopexit, %.prol.loopexit80
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next68, %wide.trip.count69
  br i1 %exitcond70, label %._crit_edge14.loopexit, label %.lr.ph13.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph13.split.us, %._crit_edge.us.us
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge.us.us ], [ 0, %.lr.ph13.split.us ]
  %47 = icmp eq i32 %xtraiter76, 0
  %48 = getelementptr inbounds double, double* %5, i64 %indvars.iv59
  store double 0.000000e+00, double* %48, align 8
  br i1 %47, label %.prol.loopexit75, label %.prol.preheader74

.prol.preheader74:                                ; preds = %.lr.ph.us.us
  %49 = load double, double* %19, align 8
  %50 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv59
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fadd double %52, 0.000000e+00
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr88 = mul i64 %indvars.iv59, 8
  %sunkaddr89 = add i64 %sunkaddr, %sunkaddr88
  %sunkaddr90 = inttoptr i64 %sunkaddr89 to double*
  store double %53, double* %sunkaddr90, align 8
  br label %.prol.loopexit75

.prol.loopexit75:                                 ; preds = %.prol.preheader74, %.lr.ph.us.us
  %54 = phi double [ %53, %.prol.preheader74 ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv55.unr.ph = phi i64 [ 1, %.prol.preheader74 ], [ 0, %.lr.ph.us.us ]
  %55 = icmp eq i32 %8, 0
  br i1 %55, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit75
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit75
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, %wide.trip.count61
  br i1 %exitcond62, label %.lr.ph9.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %56 = phi double [ %68, %.lr.ph.us.us.new ], [ %54, %.lr.ph.us.us.new.preheader ]
  %indvars.iv55 = phi i64 [ %indvars.iv.next56.1, %.lr.ph.us.us.new ], [ %indvars.iv55.unr.ph, %.lr.ph.us.us.new.preheader ]
  %57 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv55
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv59
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = fadd double %61, %56
  %sunkaddr91 = ptrtoint double* %5 to i64
  %sunkaddr92 = mul i64 %indvars.iv59, 8
  %sunkaddr93 = add i64 %sunkaddr91, %sunkaddr92
  %sunkaddr94 = inttoptr i64 %sunkaddr93 to double*
  store double %62, double* %sunkaddr94, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %63 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv.next56
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next56, i64 %indvars.iv59
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = fadd double %67, %62
  store double %68, double* %sunkaddr94, align 8
  %indvars.iv.next56.1 = add nuw nsw i64 %indvars.iv55, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56.1, %wide.trip.count61
  br i1 %exitcond58.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph13.split:                                   ; preds = %.lr.ph13.split, %.lr.ph13.split.preheader.new
  %indvars.iv47 = phi i64 [ %indvars.iv47.unr, %.lr.ph13.split.preheader.new ], [ %indvars.iv.next48.7, %.lr.ph13.split ]
  %indvars.iv.next48.7 = add nsw i64 %indvars.iv47, 8
  %exitcond50.7 = icmp eq i64 %indvars.iv.next48.7, %wide.trip.count69
  br i1 %exitcond50.7, label %._crit_edge14.loopexit95, label %.lr.ph13.split

._crit_edge14.loopexit:                           ; preds = %._crit_edge10.us
  br label %._crit_edge14

._crit_edge14.loopexit95:                         ; preds = %.lr.ph13.split
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit95, %._crit_edge14.loopexit, %.lr.ph13.split.prol.loopexit, %14
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond = icmp eq i64 %indvars.iv.next72, %9
  br i1 %exitcond, label %._crit_edge23.loopexit, label %14

._crit_edge23.loopexit:                           ; preds = %._crit_edge14
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #1 {
  %3 = call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  call fastcc void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %5 to [160 x double]*
  %9 = bitcast i8* %4 to double*
  call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %8, double* %9)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %10 = icmp sgt i32 %0, 42
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %2
  %12 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %12, align 1
  %13 = icmp eq i8 %strcmpload, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %11
  %15 = bitcast i8* %3 to [140 x [160 x double]]*
  call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %15)
  br label %._crit_edge

._crit_edge:                                      ; preds = %11, %2, %14
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*) unnamed_addr #0 {
.lr.ph20:
  br label %.lr.ph13.us

.lr.ph13.us:                                      ; preds = %._crit_edge14.us, %.lr.ph20
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %._crit_edge14.us ], [ 0, %.lr.ph20 ]
  br label %.lr.ph9.us.us

._crit_edge14.us:                                 ; preds = %._crit_edge10.us.us
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next55, 150
  br i1 %exitcond60, label %.lr.ph2.split.us.preheader, label %.lr.ph13.us

.lr.ph2.split.us.preheader:                       ; preds = %._crit_edge14.us
  br label %.lr.ph2.split.us

.lr.ph9.us.us:                                    ; preds = %.lr.ph13.us, %._crit_edge10.us.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %._crit_edge10.us.us ], [ 0, %.lr.ph13.us ]
  %5 = mul nuw nsw i64 %indvars.iv50, %indvars.iv54
  %6 = trunc i64 %5 to i32
  br label %7

._crit_edge10.us.us:                              ; preds = %7
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, 140
  br i1 %exitcond53, label %._crit_edge14.us, label %.lr.ph9.us.us

; <label>:7:                                      ; preds = %7, %.lr.ph9.us.us
  %indvars.iv46 = phi i64 [ 0, %.lr.ph9.us.us ], [ %indvars.iv.next47.1, %7 ]
  %8 = trunc i64 %indvars.iv46 to i32
  %9 = add nuw nsw i32 %6, %8
  %10 = srem i32 %9, 160
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv54, i64 %indvars.iv50, i64 %indvars.iv46
  %indvars.iv.next47 = or i64 %indvars.iv46, 1
  %13 = trunc i64 %indvars.iv.next47 to i32
  %14 = add nuw nsw i32 %6, %13
  %15 = srem i32 %14, 160
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %11, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fdiv <2 x double> %18, <double 1.600000e+02, double 1.600000e+02>
  %20 = bitcast double* %12 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %exitcond49.1 = icmp eq i64 %indvars.iv.next47.1, 160
  br i1 %exitcond49.1, label %._crit_edge10.us.us, label %7

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph2.split.us.preheader
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge.us ], [ 0, %.lr.ph2.split.us.preheader ]
  %21 = trunc i64 %indvars.iv43 to i32
  br label %22

; <label>:22:                                     ; preds = %22, %.lr.ph2.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph2.split.us ], [ %indvars.iv.next.1, %22 ]
  %23 = trunc i64 %indvars.iv to i32
  %24 = mul nuw nsw i32 %21, %23
  %25 = srem i32 %24, 160
  %26 = sitofp i32 %25 to double
  %27 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv43, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %28 = trunc i64 %indvars.iv.next to i32
  %29 = mul nuw nsw i32 %21, %28
  %30 = srem i32 %29, 160
  %31 = sitofp i32 %30 to double
  %32 = insertelement <2 x double> undef, double %26, i32 0
  %33 = insertelement <2 x double> %32, double %31, i32 1
  %34 = fdiv <2 x double> %33, <double 1.600000e+02, double 1.600000e+02>
  %35 = bitcast double* %27 to <2 x double>*
  store <2 x double> %34, <2 x double>* %35, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.us, label %22

._crit_edge.us:                                   ; preds = %22
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next44, 160
  br i1 %exitcond59, label %._crit_edge3, label %.lr.ph2.split.us

._crit_edge3:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]*) unnamed_addr #1 {
.lr.ph12:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph5.us

.lr.ph5.us:                                       ; preds = %._crit_edge6.us, %.lr.ph12
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge6.us ], [ 0, %.lr.ph12 ]
  %8 = trunc i64 %indvars.iv40 to i32
  %9 = mul i32 %8, 140
  br label %.lr.ph.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge3.us.us
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond = icmp eq i64 %indvars.iv.next41, 150
  br i1 %exitcond, label %._crit_edge13, label %.lr.ph5.us

.lr.ph.us.us:                                     ; preds = %.lr.ph5.us, %._crit_edge3.us.us
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge3.us.us ], [ 0, %.lr.ph5.us ]
  %10 = trunc i64 %indvars.iv36 to i32
  %tmp.us.us = add i32 %9, %10
  %tmp1.us.us = mul i32 %tmp.us.us, 160
  br label %11

._crit_edge3.us.us:                               ; preds = %._crit_edge.us.us
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, 140
  br i1 %exitcond39, label %._crit_edge6.us, label %.lr.ph.us.us

; <label>:11:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us ]
  %12 = trunc i64 %indvars.iv to i32
  %13 = add i32 %tmp1.us.us, %12
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge.us.us

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %16, %11
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv40, i64 %indvars.iv36, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond35, label %._crit_edge3.us.us, label %11

._crit_edge13:                                    ; preds = %._crit_edge6.us
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
