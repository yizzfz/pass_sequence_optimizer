; ModuleID = 'A.ll'
source_filename = "doitgen.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]*, double*) #0 {
  %7 = alloca [160 x double]*, align 8
  store [160 x double]* %4, [160 x double]** %7, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph15, label %._crit_edge16

.lr.ph15:                                         ; preds = %6
  %9 = load [160 x double]*, [160 x double]** %7, align 8
  %10 = add i32 %2, -1
  %11 = zext i32 %10 to i64
  %12 = shl nuw nsw i64 %11, 3
  %13 = add nuw nsw i64 %12, 8
  %xtraiter40 = and i32 %2, 1
  %wide.trip.count44 = zext i32 %2 to i64
  %wide.trip.count36.1 = zext i32 %2 to i64
  %xtraiter54 = and i32 %2, 3
  %wide.trip.count48.3 = zext i32 %2 to i64
  %wide.trip.count59 = zext i32 %1 to i64
  %xtraiter = and i32 %2, 3
  %wide.trip.count.3 = zext i32 %2 to i64
  %wide.trip.count29 = zext i32 %1 to i64
  %14 = add nsw i32 %xtraiter, -1
  %15 = zext i32 %14 to i64
  %16 = add nuw nsw i64 %15, 1
  %17 = icmp sgt i32 %1, 0
  %18 = icmp sgt i32 %2, 0
  %19 = icmp sgt i32 %2, 0
  %20 = icmp eq i32 %xtraiter40, 0
  %21 = icmp eq i32 %10, 0
  %sunkaddr = ptrtoint double* %5 to i64
  %22 = ptrtoint double* %5 to i64
  %23 = icmp sgt i32 %2, 0
  %24 = icmp eq i32 %xtraiter54, 0
  %25 = icmp ult i32 %10, 3
  %26 = bitcast double* %5 to i8*
  %27 = icmp sgt i32 %2, 0
  %28 = icmp eq i32 %xtraiter, 0
  %29 = icmp ult i32 %10, 3
  br label %._crit_edge12._crit_edge

._crit_edge12._crit_edge:                         ; preds = %._crit_edge12, %.lr.ph15
  %30 = phi i32 [ 0, %.lr.ph15 ], [ %105, %._crit_edge12 ]
  br i1 %17, label %.lr.ph11, label %._crit_edge12

.lr.ph11:                                         ; preds = %._crit_edge12._crit_edge
  %31 = sext i32 %30 to i64
  %32 = sext i32 %30 to i64
  br i1 %18, label %.lr.ph11.split.us.preheader, label %.lr.ph11.split.preheader

.lr.ph11.split.preheader:                         ; preds = %.lr.ph11
  br label %.lr.ph11.split

.lr.ph11.split.us.preheader:                      ; preds = %.lr.ph11
  br label %.lr.ph11.split.us

.lr.ph11.split.us:                                ; preds = %.lr.ph11.split.us.preheader, %._crit_edge9.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge9.us ], [ 0, %.lr.ph11.split.us.preheader ]
  %33 = phi i32 [ %split6.us68, %._crit_edge9.us ], [ %30, %.lr.ph11.split.us.preheader ]
  br i1 %19, label %.lr.ph.us.us.preheader, label %._crit_edge5.us.thread

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph11.split.us
  %34 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %31, i64 %indvars.iv57, i64 0
  br label %.lr.ph.us.us

._crit_edge5.us.thread:                           ; preds = %.lr.ph11.split.us
  call void @llvm.memset.p0i8.i64(i8* %26, i8 0, i64 %13, i32 8, i1 false)
  br label %._crit_edge9.us

._crit_edge5.us:                                  ; preds = %._crit_edge.us.us
  br i1 %23, label %.lr.ph8.us, label %._crit_edge9.us

.lr.ph8.us:                                       ; preds = %._crit_edge5.us
  br i1 %24, label %.prol.loopexit53, label %.prol.preheader52.preheader

.prol.preheader52.preheader:                      ; preds = %.lr.ph8.us
  br label %.prol.preheader52

.prol.preheader52:                                ; preds = %.prol.preheader52.preheader, %.prol.preheader52..prol.preheader52_crit_edge
  %indvars.iv46.prol = phi i64 [ %indvars.iv.next47.prol, %.prol.preheader52..prol.preheader52_crit_edge ], [ 0, %.prol.preheader52.preheader ]
  %prol.iter56 = phi i32 [ %prol.iter56.sub, %.prol.preheader52..prol.preheader52_crit_edge ], [ %xtraiter54, %.prol.preheader52.preheader ]
  %35 = getelementptr inbounds double, double* %5, i64 %indvars.iv46.prol
  %36 = bitcast double* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %indvars.iv57, i64 %indvars.iv46.prol
  %39 = bitcast double* %38 to i64*
  store i64 %37, i64* %39, align 8
  %prol.iter56.sub = add nsw i32 %prol.iter56, -1
  %prol.iter56.cmp = icmp eq i32 %prol.iter56.sub, 0
  br i1 %prol.iter56.cmp, label %.prol.loopexit53.loopexit, label %.prol.preheader52..prol.preheader52_crit_edge, !llvm.loop !1

.prol.preheader52..prol.preheader52_crit_edge:    ; preds = %.prol.preheader52
  %indvars.iv.next47.prol = add nuw nsw i64 %indvars.iv46.prol, 1
  br label %.prol.preheader52

.prol.loopexit53.loopexit:                        ; preds = %.prol.preheader52
  br label %.prol.loopexit53

.prol.loopexit53:                                 ; preds = %.prol.loopexit53.loopexit, %.lr.ph8.us
  %indvars.iv46.unr = phi i64 [ 0, %.lr.ph8.us ], [ %16, %.prol.loopexit53.loopexit ]
  br i1 %25, label %._crit_edge9.us, label %.lr.ph8.us.new.preheader

.lr.ph8.us.new.preheader:                         ; preds = %.prol.loopexit53
  br label %.lr.ph8.us.new

.lr.ph8.us.new:                                   ; preds = %.lr.ph8.us.new.preheader, %.lr.ph8.us.new
  %indvars.iv46 = phi i64 [ %indvars.iv.next47.3, %.lr.ph8.us.new ], [ %indvars.iv46.unr, %.lr.ph8.us.new.preheader ]
  %40 = getelementptr inbounds double, double* %5, i64 %indvars.iv46
  %41 = bitcast double* %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %indvars.iv57, i64 %indvars.iv46
  %44 = bitcast double* %43 to i64*
  store i64 %42, i64* %44, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %45 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next47
  %46 = bitcast double* %45 to i64*
  %47 = load i64, i64* %46, align 8
  %48 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %indvars.iv57, i64 %indvars.iv.next47
  %49 = bitcast double* %48 to i64*
  store i64 %47, i64* %49, align 8
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %50 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next47.1
  %51 = bitcast double* %50 to i64*
  %52 = load i64, i64* %51, align 8
  %53 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %indvars.iv57, i64 %indvars.iv.next47.1
  %54 = bitcast double* %53 to i64*
  store i64 %52, i64* %54, align 8
  %indvars.iv.next47.2 = add nsw i64 %indvars.iv46, 3
  %55 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next47.2
  %56 = bitcast double* %55 to i64*
  %57 = load i64, i64* %56, align 8
  %58 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %indvars.iv57, i64 %indvars.iv.next47.2
  %59 = bitcast double* %58 to i64*
  store i64 %57, i64* %59, align 8
  %indvars.iv.next47.3 = add nsw i64 %indvars.iv46, 4
  %exitcond49.3 = icmp eq i64 %indvars.iv.next47.3, %wide.trip.count48.3
  br i1 %exitcond49.3, label %._crit_edge9.us.loopexit, label %.lr.ph8.us.new

._crit_edge9.us.loopexit:                         ; preds = %.lr.ph8.us.new
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %.prol.loopexit53, %._crit_edge5.us, %._crit_edge5.us.thread
  %split6.us68 = phi i32 [ %33, %._crit_edge5.us.thread ], [ %30, %._crit_edge5.us ], [ %30, %.prol.loopexit53 ], [ %30, %._crit_edge9.us.loopexit ]
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond60, label %._crit_edge12.loopexit, label %.lr.ph11.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv42 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next43, %._crit_edge.us.us ]
  %60 = getelementptr inbounds double, double* %5, i64 %indvars.iv42
  store double 0.000000e+00, double* %60, align 8
  br i1 %20, label %.prol.loopexit39, label %61

; <label>:61:                                     ; preds = %.lr.ph.us.us
  %62 = load double, double* %34, align 8
  %63 = getelementptr inbounds [160 x double], [160 x double]* %9, i64 0, i64 %indvars.iv42
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fadd double %65, 0.000000e+00
  %sunkaddr61 = shl i64 %indvars.iv42, 3
  %sunkaddr62 = add i64 %22, %sunkaddr61
  %sunkaddr63 = inttoptr i64 %sunkaddr62 to double*
  store double %66, double* %sunkaddr63, align 8
  br label %.prol.loopexit39

.prol.loopexit39:                                 ; preds = %.lr.ph.us.us, %61
  %indvars.iv34.unr.ph = phi i64 [ 1, %61 ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %66, %61 ], [ 0.000000e+00, %.lr.ph.us.us ]
  br i1 %21, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit39
  %sunkaddr70 = shl nuw nsw i64 %indvars.iv42, 3
  %sunkaddr71 = add i64 %sunkaddr, %sunkaddr70
  %sunkaddr72 = inttoptr i64 %sunkaddr71 to double*
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit39
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next43, %wide.trip.count44
  br i1 %exitcond45, label %._crit_edge5.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv34 = phi i64 [ %indvars.iv.next35.1, %.lr.ph.us.us.new ], [ %indvars.iv34.unr.ph, %.lr.ph.us.us.new.preheader ]
  %67 = phi double [ %79, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %68 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %31, i64 %indvars.iv57, i64 %indvars.iv34
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds [160 x double], [160 x double]* %9, i64 %indvars.iv34, i64 %indvars.iv42
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = fadd double %67, %72
  store double %73, double* %sunkaddr72, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %74 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %31, i64 %indvars.iv57, i64 %indvars.iv.next35
  %75 = load double, double* %74, align 8
  %76 = getelementptr inbounds [160 x double], [160 x double]* %9, i64 %indvars.iv.next35, i64 %indvars.iv42
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = fadd double %73, %78
  store double %79, double* %sunkaddr72, align 8
  %indvars.iv.next35.1 = add nuw nsw i64 %indvars.iv34, 2
  %exitcond37.1 = icmp eq i64 %indvars.iv.next35.1, %wide.trip.count36.1
  br i1 %exitcond37.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph11.split:                                   ; preds = %.lr.ph11.split.preheader, %._crit_edge9
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %._crit_edge9 ], [ 0, %.lr.ph11.split.preheader ]
  br i1 %27, label %.lr.ph8, label %._crit_edge9

.lr.ph8:                                          ; preds = %.lr.ph11.split
  br i1 %28, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph8
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader..prol.preheader_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %80 = getelementptr inbounds double, double* %5, i64 %indvars.iv.prol
  %81 = bitcast double* %80 to i64*
  %82 = load i64, i64* %81, align 8
  %83 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %indvars.iv27, i64 %indvars.iv.prol
  %84 = bitcast double* %83 to i64*
  store i64 %82, i64* %84, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !3

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph8
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph8 ], [ %16, %.prol.loopexit.loopexit ]
  br i1 %29, label %._crit_edge9, label %.lr.ph8.new.preheader

.lr.ph8.new.preheader:                            ; preds = %.prol.loopexit
  br label %.lr.ph8.new

.lr.ph8.new:                                      ; preds = %.lr.ph8.new.preheader, %.lr.ph8.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph8.new ], [ %indvars.iv.unr, %.lr.ph8.new.preheader ]
  %85 = getelementptr inbounds double, double* %5, i64 %indvars.iv
  %86 = bitcast double* %85 to i64*
  %87 = load i64, i64* %86, align 8
  %88 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %indvars.iv27, i64 %indvars.iv
  %89 = bitcast double* %88 to i64*
  store i64 %87, i64* %89, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %90 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next
  %91 = bitcast double* %90 to i64*
  %92 = load i64, i64* %91, align 8
  %93 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %indvars.iv27, i64 %indvars.iv.next
  %94 = bitcast double* %93 to i64*
  store i64 %92, i64* %94, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %95 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next.1
  %96 = bitcast double* %95 to i64*
  %97 = load i64, i64* %96, align 8
  %98 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %indvars.iv27, i64 %indvars.iv.next.1
  %99 = bitcast double* %98 to i64*
  store i64 %97, i64* %99, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %100 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next.2
  %101 = bitcast double* %100 to i64*
  %102 = load i64, i64* %101, align 8
  %103 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %indvars.iv27, i64 %indvars.iv.next.2
  %104 = bitcast double* %103 to i64*
  store i64 %102, i64* %104, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge9.loopexit, label %.lr.ph8.new

._crit_edge9.loopexit:                            ; preds = %.lr.ph8.new
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %.prol.loopexit, %.lr.ph11.split
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond = icmp eq i64 %indvars.iv.next28, %wide.trip.count29
  br i1 %exitcond, label %._crit_edge12.loopexit75, label %.lr.ph11.split

._crit_edge12.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge12

._crit_edge12.loopexit75:                         ; preds = %._crit_edge9
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit75, %._crit_edge12.loopexit, %._crit_edge12._crit_edge
  %.lcssa2 = phi i32 [ %30, %._crit_edge12._crit_edge ], [ %split6.us68, %._crit_edge12.loopexit ], [ %30, %._crit_edge12.loopexit75 ]
  %105 = add nsw i32 %.lcssa2, 1
  %106 = icmp slt i32 %105, %0
  br i1 %106, label %._crit_edge12._crit_edge, label %._crit_edge16.loopexit

._crit_edge16.loopexit:                           ; preds = %._crit_edge12
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  call void @init_array([140 x [160 x double]]* %6, [160 x double]* %7)
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
  call void @print_array([140 x [160 x double]]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([140 x [160 x double]]* nocapture, [160 x double]* nocapture) #2 {
.lr.ph11.preheader:
  br label %.lr.ph11

.lr.ph11:                                         ; preds = %._crit_edge9, %.lr.ph11.preheader
  %indvars.iv21 = phi i64 [ 0, %.lr.ph11.preheader ], [ %indvars.iv.next22, %._crit_edge9 ]
  br label %.lr.ph5

.lr.ph5:                                          ; preds = %._crit_edge6, %.lr.ph11
  %indvars.iv18 = phi i64 [ 0, %.lr.ph11 ], [ %indvars.iv.next19, %._crit_edge6 ]
  %2 = mul nuw nsw i64 %indvars.iv21, %indvars.iv18
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %.lr.ph5
  %indvars.iv15 = phi i64 [ 0, %.lr.ph5 ], [ %indvars.iv.next16.1, %._crit_edge1 ]
  %3 = add nuw nsw i64 %2, %indvars.iv15
  %4 = trunc i64 %3 to i32
  %5 = srem i32 %4, 160
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv21, i64 %indvars.iv18, i64 %indvars.iv15
  %indvars.iv.next16 = or i64 %indvars.iv15, 1
  %8 = add nuw nsw i64 %2, %indvars.iv.next16
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 160
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %6, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  %14 = fdiv <2 x double> %13, <double 1.600000e+02, double 1.600000e+02>
  %15 = bitcast double* %7 to <2 x double>*
  store <2 x double> %14, <2 x double>* %15, align 8
  %indvars.iv.next16.1 = add nuw nsw i64 %indvars.iv15, 2
  %exitcond17.1 = icmp eq i64 %indvars.iv.next16.1, 160
  br i1 %exitcond17.1, label %._crit_edge6, label %._crit_edge1

._crit_edge6:                                     ; preds = %._crit_edge1
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next19, 140
  br i1 %exitcond20, label %._crit_edge9, label %.lr.ph5

._crit_edge9:                                     ; preds = %._crit_edge6
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next22, 150
  br i1 %exitcond23, label %.lr.ph2.preheader, label %.lr.ph11

.lr.ph2.preheader:                                ; preds = %._crit_edge9
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %.lr.ph2.preheader, %._crit_edge
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge ], [ 0, %.lr.ph2.preheader ]
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %.lr.ph2
  %indvars.iv = phi i64 [ 0, %.lr.ph2 ], [ %indvars.iv.next.1, %._crit_edge2 ]
  %16 = mul nuw nsw i64 %indvars.iv13, %indvars.iv
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 160
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds [160 x double], [160 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %21 = mul nuw nsw i64 %indvars.iv13, %indvars.iv.next
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 160
  %24 = sitofp i32 %23 to double
  %25 = insertelement <2 x double> undef, double %19, i32 0
  %26 = insertelement <2 x double> %25, double %24, i32 1
  %27 = fdiv <2 x double> %26, <double 1.600000e+02, double 1.600000e+02>
  %28 = bitcast double* %20 to <2 x double>*
  store <2 x double> %27, <2 x double>* %28, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge, label %._crit_edge2

._crit_edge:                                      ; preds = %._crit_edge2
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, 160
  br i1 %exitcond, label %._crit_edge3, label %.lr.ph2

._crit_edge3:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) #1

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([140 x [160 x double]]* nocapture readonly) #0 {
.lr.ph5.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph5

.lr.ph5:                                          ; preds = %._crit_edge3, %.lr.ph5.preheader
  %indvars.iv10 = phi i64 [ 0, %.lr.ph5.preheader ], [ %indvars.iv.next11, %._crit_edge3 ]
  %5 = mul nuw nsw i64 %indvars.iv10, 140
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.lr.ph5
  %indvars.iv7 = phi i64 [ 0, %.lr.ph5 ], [ %indvars.iv.next8, %._crit_edge ]
  %6 = add nuw nsw i64 %5, %indvars.iv7
  %7 = mul nuw nsw i64 %6, 160
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge1, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge1 ]
  %8 = add nuw nsw i64 %7, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge1

; <label>:12:                                     ; preds = %._crit_edge2
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge2, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv10, i64 %indvars.iv7, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %._crit_edge, label %._crit_edge2

._crit_edge:                                      ; preds = %._crit_edge1
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 140
  br i1 %exitcond9, label %._crit_edge3, label %.lr.ph

._crit_edge3:                                     ; preds = %._crit_edge
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 150
  br i1 %exitcond12, label %._crit_edge6, label %.lr.ph5

._crit_edge6:                                     ; preds = %._crit_edge3
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
