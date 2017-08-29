; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %8)
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double*, [1200 x double]*) unnamed_addr #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %20, %4
  %indvars.iv6 = phi i64 [ 0, %4 ], [ %indvars.iv.next7, %20 ]
  %5 = trunc i64 %indvars.iv6 to i32
  %6 = sitofp i32 %5 to double
  br label %7

; <label>:7:                                      ; preds = %7, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv6, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.200000e+03
  %12 = fadd double %6, %11
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv6, i64 %indvars.iv
  store double %12, double* %13, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = mul nuw nsw i64 %indvars.iv6, %indvars.iv.next
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 1.200000e+03
  %18 = fadd double %6, %17
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv6, i64 %indvars.iv.next
  store double %18, double* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next7, 1400
  br i1 %exitcond, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
  %8 = alloca double, align 8
  %9 = alloca [1200 x double]*, align 8
  %10 = alloca [1200 x double]*, align 8
  %11 = alloca double*, align 8
  %12 = alloca double*, align 8
  %13 = alloca double, align 8
  store double %2, double* %8, align 8
  store [1200 x double]* %3, [1200 x double]** %9, align 8
  store [1200 x double]* %4, [1200 x double]** %10, align 8
  store double* %5, double** %11, align 8
  store double* %6, double** %12, align 8
  store double 1.000000e-01, double* %13, align 8
  %14 = icmp sgt i32 %0, 0
  br i1 %14, label %.lr.ph77, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %7
  br label %._crit_edge9

.lr.ph77:                                         ; preds = %7
  %wide.trip.count147.3 = zext i32 %1 to i64
  %15 = icmp sgt i32 %1, 0
  %16 = sext i32 %0 to i64
  br i1 %15, label %.lr.ph77.split.us.preheader, label %.lr.ph77.split.preheader

.lr.ph77.split.preheader:                         ; preds = %.lr.ph77
  %xtraiter203 = and i64 %16, 1
  %lcmp.mod204 = icmp eq i64 %xtraiter203, 0
  br i1 %lcmp.mod204, label %.lr.ph77.split.prol.loopexit, label %.lr.ph77.split.prol.preheader

.lr.ph77.split.prol.preheader:                    ; preds = %.lr.ph77.split.preheader
  br label %.lr.ph77.split.prol

.lr.ph77.split.prol:                              ; preds = %.lr.ph77.split.prol.preheader
  %17 = fdiv double 0.000000e+00, %2
  store double %17, double* %5, align 8
  br label %.lr.ph77.split.prol.loopexit

.lr.ph77.split.prol.loopexit:                     ; preds = %.lr.ph77.split.preheader, %.lr.ph77.split.prol
  %indvars.iv156.unr = phi i64 [ 0, %.lr.ph77.split.preheader ], [ 1, %.lr.ph77.split.prol ]
  %storemerge75.unr = phi i64 [ 0, %.lr.ph77.split.preheader ], [ 1, %.lr.ph77.split.prol ]
  %18 = icmp eq i32 %0, 1
  br i1 %18, label %._crit_edge.loopexit198, label %.lr.ph77.split.preheader.new

.lr.ph77.split.preheader.new:                     ; preds = %.lr.ph77.split.prol.loopexit
  br label %.lr.ph77.split

.lr.ph77.split.us.preheader:                      ; preds = %.lr.ph77
  %19 = add i32 %1, -1
  %xtraiter151 = and i32 %1, 3
  %20 = icmp eq i32 %xtraiter151, 0
  %21 = icmp ult i32 %19, 3
  %sunkaddr176 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  br label %.lr.ph77.split.us

.lr.ph77.split.us:                                ; preds = %.lr.ph77.split.us.preheader, %._crit_edge72.us
  %indvars.iv153 = phi i64 [ 0, %.lr.ph77.split.us.preheader ], [ %indvars.iv.next154, %._crit_edge72.us ]
  %storemerge75.us = phi i64 [ 0, %.lr.ph77.split.us.preheader ], [ %indvars.iv.next154, %._crit_edge72.us ]
  %sext164 = shl i64 %storemerge75.us, 32
  %22 = ashr exact i64 %sext164, 32
  %23 = getelementptr inbounds double, double* %5, i64 %22
  store double 0.000000e+00, double* %23, align 8
  br i1 %20, label %.prol.loopexit150, label %.prol.preheader149.preheader

.prol.preheader149.preheader:                     ; preds = %.lr.ph77.split.us
  %sunkaddr173 = shl i64 %indvars.iv153, 3
  %sunkaddr174 = add i64 %sunkaddr, %sunkaddr173
  %sunkaddr175 = inttoptr i64 %sunkaddr174 to double*
  br label %.prol.preheader149

.prol.preheader149:                               ; preds = %.prol.preheader149.preheader, %.prol.preheader149
  %indvars.iv145.prol = phi i64 [ %indvars.iv.next146.prol, %.prol.preheader149 ], [ 0, %.prol.preheader149.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader149 ], [ %xtraiter151, %.prol.preheader149.preheader ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv145.prol, i64 %indvars.iv153
  %25 = load double, double* %24, align 8
  %26 = load double, double* %sunkaddr175, align 8
  %27 = fadd double %25, %26
  store double %27, double* %sunkaddr175, align 8
  %indvars.iv.next146.prol = add nuw nsw i64 %indvars.iv145.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit150.loopexit, label %.prol.preheader149, !llvm.loop !1

.prol.loopexit150.loopexit:                       ; preds = %.prol.preheader149
  br label %.prol.loopexit150

.prol.loopexit150:                                ; preds = %.prol.loopexit150.loopexit, %.lr.ph77.split.us
  %indvars.iv145.unr = phi i64 [ 0, %.lr.ph77.split.us ], [ %indvars.iv.next146.prol, %.prol.loopexit150.loopexit ]
  br i1 %21, label %._crit_edge72.us, label %.lr.ph77.split.us.new.preheader

.lr.ph77.split.us.new.preheader:                  ; preds = %.prol.loopexit150
  %sunkaddr177 = shl i64 %indvars.iv153, 3
  %sunkaddr178 = add i64 %sunkaddr176, %sunkaddr177
  %sunkaddr179 = inttoptr i64 %sunkaddr178 to double*
  br label %.lr.ph77.split.us.new

.lr.ph77.split.us.new:                            ; preds = %.lr.ph77.split.us.new.preheader, %.lr.ph77.split.us.new
  %indvars.iv145 = phi i64 [ %indvars.iv.next146.3, %.lr.ph77.split.us.new ], [ %indvars.iv145.unr, %.lr.ph77.split.us.new.preheader ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv145, i64 %indvars.iv153
  %29 = load double, double* %28, align 8
  %30 = load double, double* %sunkaddr179, align 8
  %31 = fadd double %29, %30
  store double %31, double* %sunkaddr179, align 8
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next146, i64 %indvars.iv153
  %33 = load double, double* %32, align 8
  %34 = fadd double %33, %31
  store double %34, double* %sunkaddr179, align 8
  %indvars.iv.next146.1 = add nsw i64 %indvars.iv145, 2
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next146.1, i64 %indvars.iv153
  %36 = load double, double* %35, align 8
  %37 = fadd double %36, %34
  store double %37, double* %sunkaddr179, align 8
  %indvars.iv.next146.2 = add nsw i64 %indvars.iv145, 3
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next146.2, i64 %indvars.iv153
  %39 = load double, double* %38, align 8
  %40 = fadd double %39, %37
  store double %40, double* %sunkaddr179, align 8
  %indvars.iv.next146.3 = add nsw i64 %indvars.iv145, 4
  %exitcond148.3 = icmp eq i64 %indvars.iv.next146.3, %wide.trip.count147.3
  br i1 %exitcond148.3, label %._crit_edge72.us.loopexit, label %.lr.ph77.split.us.new

._crit_edge72.us.loopexit:                        ; preds = %.lr.ph77.split.us.new
  br label %._crit_edge72.us

._crit_edge72.us:                                 ; preds = %._crit_edge72.us.loopexit, %.prol.loopexit150
  %41 = getelementptr inbounds double, double* %5, i64 %indvars.iv153
  %42 = load double, double* %41, align 8
  %43 = fdiv double %42, %2
  store double %43, double* %41, align 8
  %indvars.iv.next154 = add nsw i64 %indvars.iv153, 1
  %44 = icmp slt i64 %indvars.iv.next154, %16
  br i1 %44, label %.lr.ph77.split.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge72.us
  br label %._crit_edge

._crit_edge.loopexit198.unr-lcssa:                ; preds = %.lr.ph77.split
  br label %._crit_edge.loopexit198

._crit_edge.loopexit198:                          ; preds = %.lr.ph77.split.prol.loopexit, %._crit_edge.loopexit198.unr-lcssa
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit198, %._crit_edge.loopexit
  br i1 true, label %.lr.ph64, label %._crit_edge.._crit_edge9_crit_edge

._crit_edge.._crit_edge9_crit_edge:               ; preds = %._crit_edge
  br label %._crit_edge9

.lr.ph64:                                         ; preds = %._crit_edge
  %45 = load double*, double** %12, align 8
  %46 = load double, double* %8, align 8
  %47 = load double, double* %13, align 8
  %48 = load [1200 x double]*, [1200 x double]** %9, align 8
  %49 = bitcast double** %11 to i64*
  %50 = load i64, i64* %49, align 8
  %51 = ptrtoint double* %45 to i64
  br i1 %15, label %.lr.ph64.split.us.preheader, label %.lr.ph64.split.preheader

.lr.ph64.split.preheader:                         ; preds = %.lr.ph64
  br label %.lr.ph64.split

.lr.ph64.split.us.preheader:                      ; preds = %.lr.ph64
  %52 = sext i32 %1 to i64
  %xtraiter202 = and i64 %52, 1
  %lcmp.mod = icmp eq i64 %xtraiter202, 0
  %53 = icmp eq i32 %1, 1
  br label %.lr.ph64.split.us

.lr.ph64.split.us:                                ; preds = %.lr.ph64.split.us.preheader, %._crit_edge60.us
  %indvars.iv139 = phi i64 [ 0, %.lr.ph64.split.us.preheader ], [ %indvars.iv.next140, %._crit_edge60.us ]
  %storemerge163.us = phi i64 [ 0, %.lr.ph64.split.us.preheader ], [ %indvars.iv.next140, %._crit_edge60.us ]
  %sext162 = shl i64 %storemerge163.us, 32
  %54 = ashr exact i64 %sext162, 32
  %55 = getelementptr inbounds double, double* %45, i64 %54
  store double 0.000000e+00, double* %55, align 8
  br i1 %lcmp.mod, label %.prol.loopexit201.unr-lcssa, label %.prol.preheader200

.prol.preheader200:                               ; preds = %.lr.ph64.split.us
  br label %56

; <label>:56:                                     ; preds = %.prol.preheader200
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %48, i64 0, i64 %indvars.iv139
  %58 = load double, double* %57, align 8
  %sunkaddr181.prol = shl i64 %indvars.iv139, 3
  %sunkaddr182.prol = add i64 %50, %sunkaddr181.prol
  %sunkaddr183.prol = inttoptr i64 %sunkaddr182.prol to double*
  %59 = load double, double* %sunkaddr183.prol, align 8
  %60 = fsub double %58, %59
  %61 = fmul double %60, %60
  %sunkaddr186.prol = add i64 %51, %sunkaddr181.prol
  %sunkaddr187.prol = inttoptr i64 %sunkaddr186.prol to double*
  %62 = load double, double* %sunkaddr187.prol, align 8
  %63 = fadd double %62, %61
  store double %63, double* %sunkaddr187.prol, align 8
  br label %.prol.loopexit201.unr-lcssa

.prol.loopexit201.unr-lcssa:                      ; preds = %.lr.ph64.split.us, %56
  %indvars.iv136.unr.ph = phi i64 [ 1, %56 ], [ 0, %.lr.ph64.split.us ]
  br label %.prol.loopexit201

.prol.loopexit201:                                ; preds = %.prol.loopexit201.unr-lcssa
  br i1 %53, label %._crit_edge60.us, label %.lr.ph64.split.us.new

.lr.ph64.split.us.new:                            ; preds = %.prol.loopexit201
  %sunkaddr181 = shl i64 %indvars.iv139, 3
  %sunkaddr182 = add i64 %50, %sunkaddr181
  %sunkaddr183 = inttoptr i64 %sunkaddr182 to double*
  %sunkaddr186 = add i64 %51, %sunkaddr181
  %sunkaddr187 = inttoptr i64 %sunkaddr186 to double*
  %sunkaddr181.1 = shl i64 %indvars.iv139, 3
  %sunkaddr182.1 = add i64 %50, %sunkaddr181.1
  %sunkaddr183.1 = inttoptr i64 %sunkaddr182.1 to double*
  %sunkaddr186.1 = add i64 %51, %sunkaddr181.1
  %sunkaddr187.1 = inttoptr i64 %sunkaddr186.1 to double*
  br label %64

; <label>:64:                                     ; preds = %64, %.lr.ph64.split.us.new
  %indvars.iv136 = phi i64 [ %indvars.iv136.unr.ph, %.lr.ph64.split.us.new ], [ %indvars.iv.next137.1, %64 ]
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %48, i64 %indvars.iv136, i64 %indvars.iv139
  %66 = load double, double* %65, align 8
  %67 = load double, double* %sunkaddr183, align 8
  %68 = fsub double %66, %67
  %69 = fmul double %68, %68
  %70 = load double, double* %sunkaddr187, align 8
  %71 = fadd double %70, %69
  store double %71, double* %sunkaddr187, align 8
  %indvars.iv.next137 = add nuw nsw i64 %indvars.iv136, 1
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %48, i64 %indvars.iv.next137, i64 %indvars.iv139
  %73 = load double, double* %72, align 8
  %74 = load double, double* %sunkaddr183.1, align 8
  %75 = fsub double %73, %74
  %76 = fmul double %75, %75
  %77 = load double, double* %sunkaddr187.1, align 8
  %78 = fadd double %77, %76
  store double %78, double* %sunkaddr187.1, align 8
  %indvars.iv.next137.1 = add nsw i64 %indvars.iv136, 2
  %79 = icmp slt i64 %indvars.iv.next137.1, %52
  br i1 %79, label %64, label %._crit_edge60.us.unr-lcssa

._crit_edge60.us.unr-lcssa:                       ; preds = %64
  br label %._crit_edge60.us

._crit_edge60.us:                                 ; preds = %.prol.loopexit201, %._crit_edge60.us.unr-lcssa
  %80 = getelementptr inbounds double, double* %45, i64 %indvars.iv139
  %81 = load double, double* %80, align 8
  %82 = fdiv double %81, %46
  store double %82, double* %80, align 8
  %83 = tail call double @sqrt(double %82) #4
  %84 = fcmp ole double %83, %47
  %85 = select i1 %84, double 1.000000e+00, double %83
  store double %85, double* %80, align 8
  %indvars.iv.next140 = add nsw i64 %indvars.iv139, 1
  %86 = icmp slt i64 %indvars.iv.next140, %16
  br i1 %86, label %.lr.ph64.split.us, label %.._crit_edge9_crit_edge.loopexit

.lr.ph77.split:                                   ; preds = %.lr.ph77.split, %.lr.ph77.split.preheader.new
  %indvars.iv156 = phi i64 [ %indvars.iv156.unr, %.lr.ph77.split.preheader.new ], [ %indvars.iv.next157.1, %.lr.ph77.split ]
  %storemerge75 = phi i64 [ %storemerge75.unr, %.lr.ph77.split.preheader.new ], [ %indvars.iv.next157.1, %.lr.ph77.split ]
  %sext163 = shl i64 %storemerge75, 32
  %87 = ashr exact i64 %sext163, 32
  %88 = getelementptr inbounds double, double* %5, i64 %87
  store double 0.000000e+00, double* %88, align 8
  %89 = getelementptr inbounds double, double* %5, i64 %indvars.iv156
  %90 = load double, double* %89, align 8
  %91 = fdiv double %90, %2
  store double %91, double* %89, align 8
  %indvars.iv.next157 = add nuw nsw i64 %indvars.iv156, 1
  %sext163.1 = shl i64 %indvars.iv.next157, 32
  %92 = ashr exact i64 %sext163.1, 32
  %93 = getelementptr inbounds double, double* %5, i64 %92
  store double 0.000000e+00, double* %93, align 8
  %94 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next157
  %95 = load double, double* %94, align 8
  %96 = fdiv double %95, %2
  store double %96, double* %94, align 8
  %indvars.iv.next157.1 = add nsw i64 %indvars.iv156, 2
  %97 = icmp slt i64 %indvars.iv.next157.1, %16
  br i1 %97, label %.lr.ph77.split, label %._crit_edge.loopexit198.unr-lcssa

.._crit_edge9_crit_edge.loopexit:                 ; preds = %._crit_edge60.us
  br label %.._crit_edge9_crit_edge

.._crit_edge9_crit_edge.loopexit197:              ; preds = %.lr.ph64.split
  br label %.._crit_edge9_crit_edge

.._crit_edge9_crit_edge:                          ; preds = %.._crit_edge9_crit_edge.loopexit197, %.._crit_edge9_crit_edge.loopexit
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge.._crit_edge9_crit_edge, %._crit_edge.thread, %.._crit_edge9_crit_edge
  %98 = icmp sgt i32 %1, 0
  br i1 %98, label %._crit_edge10.lr.ph, label %._crit_edge11

._crit_edge10.lr.ph:                              ; preds = %._crit_edge9
  %99 = sext i32 %1 to i64
  %100 = load double*, double** %11, align 8
  %101 = load [1200 x double]*, [1200 x double]** %9, align 8
  %102 = load double, double* %8, align 8
  %103 = load double*, double** %12, align 8
  br i1 %14, label %._crit_edge10.us.preheader, label %.._crit_edge11_crit_edge.loopexit83

._crit_edge10.us.preheader:                       ; preds = %._crit_edge10.lr.ph
  %104 = sext i32 %0 to i64
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge10.us.preheader, %._crit_edge50.us
  %indvars.iv134 = phi i64 [ 0, %._crit_edge10.us.preheader ], [ %indvars.iv.next135, %._crit_edge50.us ]
  br label %105

; <label>:105:                                    ; preds = %._crit_edge10.us, %105
  %indvars.iv132 = phi i64 [ 0, %._crit_edge10.us ], [ %indvars.iv.next133, %105 ]
  %106 = getelementptr inbounds double, double* %100, i64 %indvars.iv132
  %107 = load double, double* %106, align 8
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %101, i64 %indvars.iv134, i64 %indvars.iv132
  %109 = load double, double* %108, align 8
  %110 = fsub double %109, %107
  store double %110, double* %108, align 8
  %111 = tail call double @sqrt(double %102) #4
  %112 = getelementptr inbounds double, double* %103, i64 %indvars.iv132
  %113 = load double, double* %112, align 8
  %114 = fmul double %111, %113
  %115 = load double, double* %108, align 8
  %116 = fdiv double %115, %114
  store double %116, double* %108, align 8
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %117 = icmp slt i64 %indvars.iv.next133, %104
  br i1 %117, label %105, label %._crit_edge50.us

._crit_edge50.us:                                 ; preds = %105
  %indvars.iv.next135 = add nsw i64 %indvars.iv134, 1
  %118 = icmp slt i64 %indvars.iv.next135, %99
  br i1 %118, label %._crit_edge10.us, label %.._crit_edge11_crit_edge.loopexit

.lr.ph64.split:                                   ; preds = %.lr.ph64.split.preheader, %.lr.ph64.split
  %indvars.iv142 = phi i64 [ 0, %.lr.ph64.split.preheader ], [ %indvars.iv.next143, %.lr.ph64.split ]
  %storemerge163 = phi i64 [ 0, %.lr.ph64.split.preheader ], [ %indvars.iv.next143, %.lr.ph64.split ]
  %sext161 = shl i64 %storemerge163, 32
  %119 = ashr exact i64 %sext161, 32
  %120 = getelementptr inbounds double, double* %45, i64 %119
  store double 0.000000e+00, double* %120, align 8
  %121 = getelementptr inbounds double, double* %45, i64 %indvars.iv142
  %122 = load double, double* %121, align 8
  %123 = fdiv double %122, %46
  store double %123, double* %121, align 8
  %124 = tail call double @sqrt(double %123) #4
  %125 = fcmp ole double %124, %47
  %126 = select i1 %125, double 1.000000e+00, double %124
  store double %126, double* %121, align 8
  %indvars.iv.next143 = add nsw i64 %indvars.iv142, 1
  %127 = icmp slt i64 %indvars.iv.next143, %16
  br i1 %127, label %.lr.ph64.split, label %.._crit_edge9_crit_edge.loopexit197

.._crit_edge11_crit_edge.loopexit:                ; preds = %._crit_edge50.us
  br label %.._crit_edge11_crit_edge

.._crit_edge11_crit_edge.loopexit83:              ; preds = %._crit_edge10.lr.ph
  br label %.._crit_edge11_crit_edge

.._crit_edge11_crit_edge:                         ; preds = %.._crit_edge11_crit_edge.loopexit83, %.._crit_edge11_crit_edge.loopexit
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %.._crit_edge11_crit_edge, %._crit_edge9
  %128 = add nsw i32 %0, -1
  %129 = icmp sgt i32 %0, 1
  %130 = load [1200 x double]*, [1200 x double]** %10, align 8
  br i1 %129, label %.lr.ph27, label %188

.lr.ph27:                                         ; preds = %._crit_edge11
  %131 = sext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  %132 = load [1200 x double]*, [1200 x double]** %9, align 8
  %133 = add nsw i64 %131, -1
  %promoted = trunc i64 %133 to i32
  br i1 %98, label %.lr.ph27.split.us.preheader, label %.lr.ph27.split.preheader

.lr.ph27.split.preheader:                         ; preds = %.lr.ph27
  %134 = add i32 %0, -2
  %135 = add i32 %0, 1
  %136 = zext i32 %135 to i64
  %137 = zext i32 %134 to i64
  br label %.lr.ph27.split

.lr.ph27.split.us.preheader:                      ; preds = %.lr.ph27
  %sext195 = shl i64 %133, 32
  %138 = ashr exact i64 %sext195, 32
  %xtraiter = and i32 %1, 1
  %139 = icmp eq i32 %xtraiter, 0
  %140 = icmp eq i32 %1, 1
  %sunkaddr188 = ptrtoint [1200 x double]* %132 to i64
  br label %.lr.ph27.split.us

.lr.ph27.split.us:                                ; preds = %.lr.ph27.split.us.preheader, %._crit_edge21.us-lcssa.us.us
  %indvars.iv109 = phi i64 [ 0, %.lr.ph27.split.us.preheader ], [ %indvars.iv.next110, %._crit_edge21.us-lcssa.us.us ]
  %indvars.iv100 = phi i64 [ 1, %.lr.ph27.split.us.preheader ], [ %indvars.iv.next101, %._crit_edge21.us-lcssa.us.us ]
  %storemerge326.us = phi i64 [ 0, %.lr.ph27.split.us.preheader ], [ %indvars.iv.next110, %._crit_edge21.us-lcssa.us.us ]
  %sext160 = shl i64 %storemerge326.us, 32
  %141 = ashr exact i64 %sext160, 32
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %130, i64 %141, i64 %141
  store double 1.000000e+00, double* %142, align 8
  %indvars.iv.next110 = add nsw i64 %indvars.iv109, 1
  %143 = icmp slt i64 %indvars.iv.next110, %131
  br i1 %143, label %.lr.ph.us.us.preheader, label %._crit_edge21.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph27.split.us
  %sunkaddr189 = shl i64 %indvars.iv109, 3
  %sunkaddr190 = add i64 %sunkaddr188, %sunkaddr189
  %sunkaddr191 = inttoptr i64 %sunkaddr190 to double*
  br label %.lr.ph.us.us

._crit_edge21.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge15.us.us
  br label %._crit_edge21.us-lcssa.us.us

._crit_edge21.us-lcssa.us.us:                     ; preds = %._crit_edge21.us-lcssa.us.us.loopexit, %.lr.ph27.split.us
  %144 = icmp slt i64 %indvars.iv.next110, %138
  %indvars.iv.next101 = add nsw i64 %indvars.iv100, 1
  br i1 %144, label %.lr.ph27.split.us, label %._crit_edge28.loopexit

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge15.us.us
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %._crit_edge15.us.us ], [ %indvars.iv100, %.lr.ph.us.us.preheader ]
  %145 = getelementptr inbounds [1200 x double], [1200 x double]* %130, i64 %indvars.iv109, i64 %indvars.iv102
  store double 0.000000e+00, double* %145, align 8
  br i1 %139, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %146 = load double, double* %sunkaddr191, align 8
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %132, i64 0, i64 %indvars.iv102
  %148 = load double, double* %147, align 8
  %149 = fmul double %146, %148
  %150 = fadd double %149, 0.000000e+00
  store double %150, double* %145, align 8
  %151 = bitcast double %150 to i64
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %152 = phi i64 [ %151, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %153 = phi double [ %150, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %140, label %._crit_edge15.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge15.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  %154 = bitcast double %170 to i64
  br label %._crit_edge15.us.us

._crit_edge15.us.us:                              ; preds = %._crit_edge15.us.us.loopexit, %.prol.loopexit
  %155 = phi i64 [ %152, %.prol.loopexit ], [ %154, %._crit_edge15.us.us.loopexit ]
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %130, i64 %indvars.iv102, i64 %indvars.iv109
  %157 = bitcast double* %156 to i64*
  store i64 %155, i64* %157, align 8
  %indvars.iv.next103 = add nsw i64 %indvars.iv102, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next103 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %0
  br i1 %exitcond, label %._crit_edge21.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %158 = phi double [ %170, %.lr.ph.us.us.new ], [ %153, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %132, i64 %indvars.iv, i64 %indvars.iv109
  %160 = load double, double* %159, align 8
  %161 = getelementptr inbounds [1200 x double], [1200 x double]* %132, i64 %indvars.iv, i64 %indvars.iv102
  %162 = load double, double* %161, align 8
  %163 = fmul double %160, %162
  %164 = fadd double %163, %158
  store double %164, double* %145, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %132, i64 %indvars.iv.next, i64 %indvars.iv109
  %166 = load double, double* %165, align 8
  %167 = getelementptr inbounds [1200 x double], [1200 x double]* %132, i64 %indvars.iv.next, i64 %indvars.iv102
  %168 = load double, double* %167, align 8
  %169 = fmul double %166, %168
  %170 = fadd double %169, %164
  store double %170, double* %145, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge15.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph27.split:                                   ; preds = %.lr.ph27.split.preheader, %._crit_edge21
  %indvars.iv128 = phi i64 [ 0, %.lr.ph27.split.preheader ], [ %indvars.iv.next129, %._crit_edge21 ]
  %indvar = phi i64 [ 0, %.lr.ph27.split.preheader ], [ %indvar.next, %._crit_edge21 ]
  %indvars.iv113 = phi i64 [ 1, %.lr.ph27.split.preheader ], [ %indvars.iv.next114, %._crit_edge21 ]
  %storemerge326 = phi i64 [ 0, %.lr.ph27.split.preheader ], [ %indvars.iv.next129, %._crit_edge21 ]
  %171 = sub i64 %137, %indvar
  %172 = trunc i64 %171 to i32
  %sext = shl i64 %storemerge326, 32
  %173 = ashr exact i64 %sext, 32
  %174 = getelementptr inbounds [1200 x double], [1200 x double]* %130, i64 %173, i64 %173
  store double 1.000000e+00, double* %174, align 8
  %indvars.iv.next129 = add nsw i64 %indvars.iv128, 1
  %175 = icmp slt i64 %indvars.iv.next129, %131
  br i1 %175, label %.lr.ph20, label %._crit_edge21

.lr.ph20:                                         ; preds = %.lr.ph27.split
  %176 = sub i64 %136, %indvar
  %xtraiter126159 = and i64 %176, 1
  %lcmp.mod127 = icmp eq i64 %xtraiter126159, 0
  br i1 %lcmp.mod127, label %.prol.loopexit125, label %.prol.preheader124

.prol.preheader124:                               ; preds = %.lr.ph20
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %130, i64 %indvars.iv128, i64 %indvars.iv113
  store double 0.000000e+00, double* %177, align 8
  %178 = getelementptr inbounds [1200 x double], [1200 x double]* %130, i64 %indvars.iv113, i64 %indvars.iv128
  %179 = bitcast double* %178 to i64*
  store i64 0, i64* %179, align 8
  %indvars.iv.next116.prol = add nsw i64 %indvars.iv113, 1
  br label %.prol.loopexit125

.prol.loopexit125:                                ; preds = %.prol.preheader124, %.lr.ph20
  %indvars.iv115.unr.ph = phi i64 [ %indvars.iv.next116.prol, %.prol.preheader124 ], [ %indvars.iv113, %.lr.ph20 ]
  %180 = icmp eq i32 %172, 0
  br i1 %180, label %._crit_edge21, label %.lr.ph20.new.preheader

.lr.ph20.new.preheader:                           ; preds = %.prol.loopexit125
  br label %.lr.ph20.new

.lr.ph20.new:                                     ; preds = %.lr.ph20.new.preheader, %.lr.ph20.new
  %indvars.iv115 = phi i64 [ %indvars.iv.next116.1, %.lr.ph20.new ], [ %indvars.iv115.unr.ph, %.lr.ph20.new.preheader ]
  %181 = getelementptr inbounds [1200 x double], [1200 x double]* %130, i64 %indvars.iv128, i64 %indvars.iv115
  store double 0.000000e+00, double* %181, align 8
  %182 = getelementptr inbounds [1200 x double], [1200 x double]* %130, i64 %indvars.iv115, i64 %indvars.iv128
  %183 = bitcast double* %182 to i64*
  store i64 0, i64* %183, align 8
  %indvars.iv.next116 = add nsw i64 %indvars.iv115, 1
  %184 = getelementptr inbounds [1200 x double], [1200 x double]* %130, i64 %indvars.iv128, i64 %indvars.iv.next116
  store double 0.000000e+00, double* %184, align 8
  %185 = getelementptr inbounds [1200 x double], [1200 x double]* %130, i64 %indvars.iv.next116, i64 %indvars.iv128
  %186 = bitcast double* %185 to i64*
  store i64 0, i64* %186, align 8
  %indvars.iv.next116.1 = add nsw i64 %indvars.iv115, 2
  %lftr.wideiv121.1 = trunc i64 %indvars.iv.next116.1 to i32
  %exitcond122.1 = icmp eq i32 %lftr.wideiv121.1, %0
  br i1 %exitcond122.1, label %._crit_edge21.loopexit, label %.lr.ph20.new

._crit_edge21.loopexit:                           ; preds = %.lr.ph20.new
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %.prol.loopexit125, %.lr.ph27.split
  %187 = icmp slt i64 %indvars.iv.next129, %133
  %indvars.iv.next114 = add nsw i64 %indvars.iv113, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %187, label %.lr.ph27.split, label %._crit_edge28.loopexit196

._crit_edge28.loopexit:                           ; preds = %._crit_edge21.us-lcssa.us.us
  br label %._crit_edge28

._crit_edge28.loopexit196:                        ; preds = %._crit_edge21
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge28.loopexit196, %._crit_edge28.loopexit
  br label %188

; <label>:188:                                    ; preds = %._crit_edge28, %._crit_edge11
  %.lcssa12 = phi i32 [ %promoted, %._crit_edge28 ], [ %128, %._crit_edge11 ]
  %189 = sext i32 %.lcssa12 to i64
  %190 = getelementptr inbounds [1200 x double], [1200 x double]* %130, i64 %189, i64 %189
  store double 1.000000e+00, double* %190, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.lr.ph, label %22

._crit_edge.lr.ph:                                ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  %8 = sext i32 %0 to i64
  br i1 true, label %._crit_edge.us.preheader, label %._crit_edge6.loopexit11

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge4.us
  %indvars.iv13 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next14, %._crit_edge4.us ]
  %9 = mul nsw i64 %indvars.iv13, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge2.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %11 = add nsw i64 %9, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge2.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %10, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge4.us, label %10

._crit_edge4.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %21 = icmp slt i64 %indvars.iv.next14, %8
  br i1 %21, label %._crit_edge.us, label %._crit_edge6.loopexit

._crit_edge6.loopexit:                            ; preds = %._crit_edge4.us
  br label %._crit_edge6

._crit_edge6.loopexit11:                          ; preds = %._crit_edge.lr.ph
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit11, %._crit_edge6.loopexit
  br label %22

; <label>:22:                                     ; preds = %._crit_edge6, %2
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
