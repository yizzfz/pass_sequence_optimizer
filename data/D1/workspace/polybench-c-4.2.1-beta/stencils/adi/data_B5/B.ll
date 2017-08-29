; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %7)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1000 x double]*) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader.lr.ph, label %._crit_edge14

.preheader.lr.ph:                                 ; preds = %2
  %4 = sitofp i32 %0 to double
  %5 = sext i32 %0 to i64
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %6 = icmp eq i32 %0, 1
  %wide.trip.count17 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  %7 = add nsw i64 %indvars.iv15, %5
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, %4
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv15, i64 0
  store double %10, double* %11, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %6, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  %12 = trunc i64 %7 to i32
  %13 = trunc i64 %7 to i32
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %14 = trunc i64 %indvars.iv to i32
  %15 = sub i32 %12, %14
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, %4
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  store double %17, double* %18, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %19 = trunc i64 %indvars.iv.next to i32
  %20 = sub i32 %13, %19
  %21 = sitofp i32 %20 to double
  %22 = fdiv double %21, %4
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv.next
  store double %22, double* %23, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, %wide.trip.count17
  br i1 %exitcond, label %._crit_edge14.loopexit, label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #2 {
  %7 = sitofp i32 %1 to double
  %8 = fdiv double 1.000000e+00, %7
  %9 = sitofp i32 %0 to double
  %10 = fdiv double 1.000000e+00, %9
  %11 = fmul double %10, 2.000000e+00
  %12 = fmul double %8, %8
  %13 = fdiv double %11, %12
  %14 = fdiv double %10, %12
  %15 = fmul double %13, -5.000000e-01
  %16 = fadd double %13, 1.000000e+00
  %17 = fmul double %14, -5.000000e-01
  %18 = fadd double %14, 1.000000e+00
  %19 = icmp slt i32 %0, 1
  br i1 %19, label %._crit_edge172, label %.preheader152.lr.ph

.preheader152.lr.ph:                              ; preds = %6
  %20 = add nsw i32 %1, -1
  %21 = icmp sgt i32 %20, 1
  %22 = sext i32 %20 to i64
  %23 = add nsw i32 %1, -2
  %24 = icmp sgt i32 %1, 2
  %25 = fsub double -0.000000e+00, %15
  %26 = fmul double %17, 2.000000e+00
  %27 = fadd double %26, 1.000000e+00
  %28 = icmp sgt i32 %1, 2
  %29 = fsub double -0.000000e+00, %17
  %30 = fmul double %15, 2.000000e+00
  %31 = fadd double %30, 1.000000e+00
  %32 = sext i32 %23 to i64
  %33 = add i32 %1, -3
  %wide.trip.count = zext i32 %20 to i64
  %xtraiter = and i32 %23, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %34 = icmp eq i32 %33, 0
  %35 = add nsw i64 %32, 1
  %indvars.iv.next174.prol = add nsw i64 %32, -1
  %wide.trip.count177 = zext i32 %20 to i64
  %36 = icmp sgt i32 %20, 1
  %37 = sext i32 %20 to i64
  %wide.trip.count181 = zext i32 %20 to i64
  %xtraiter185 = and i32 %23, 1
  %lcmp.mod186 = icmp eq i32 %xtraiter185, 0
  %38 = icmp eq i32 %33, 0
  %39 = add nsw i64 %32, 1
  %indvars.iv.next184.prol = add nsw i64 %32, -1
  %wide.trip.count189 = zext i32 %20 to i64
  br label %.preheader152

.preheader152:                                    ; preds = %._crit_edge170, %.preheader152.lr.ph
  %.0171 = phi i32 [ 1, %.preheader152.lr.ph ], [ %213, %._crit_edge170 ]
  br i1 %21, label %.lver.check.preheader, label %._crit_edge170

.lver.check.preheader:                            ; preds = %.preheader152
  br label %.lver.check

.lver.check:                                      ; preds = %.lver.check.preheader, %._crit_edge157.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge157.us ], [ 0, %.lver.check.preheader ]
  %indvars.iv175 = phi i64 [ %indvars.iv.next176, %._crit_edge157.us ], [ 1, %.lver.check.preheader ]
  %40 = add i64 %indvar, 1
  %41 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %41, i64 0
  %scevgep197 = getelementptr [1000 x double], [1000 x double]* %4, i64 %41, i64 %wide.trip.count
  %scevgep199 = getelementptr [1000 x double], [1000 x double]* %5, i64 %41, i64 0
  %scevgep201 = getelementptr [1000 x double], [1000 x double]* %5, i64 %41, i64 %wide.trip.count
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv175
  store double 1.000000e+00, double* %42, align 8
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv175, i64 0
  store double 0.000000e+00, double* %43, align 8
  %44 = bitcast double* %42 to i64*
  %45 = load i64, i64* %44, align 8
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv175
  %47 = bitcast [1000 x double]* %46 to i64*
  store i64 %45, i64* %47, align 8
  %48 = add nsw i64 %indvars.iv175, -1
  %indvars.iv.next176 = add nuw nsw i64 %indvars.iv175, 1
  %bound0 = icmp ult double* %scevgep, %scevgep201
  %bound1 = icmp ult double* %scevgep199, %scevgep197
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %49 = add nsw i64 %indvars.iv.lver.orig, -1
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv175, i64 %49
  %51 = load double, double* %50, align 8
  %52 = fmul double %15, %51
  %53 = fadd double %16, %52
  %54 = fdiv double %25, %53
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv175, i64 %indvars.iv.lver.orig
  store double %54, double* %55, align 8
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %48
  %57 = load double, double* %56, align 8
  %58 = fmul double %17, %57
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv175
  %60 = load double, double* %59, align 8
  %61 = fmul double %27, %60
  %62 = fsub double %61, %58
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next176
  %64 = load double, double* %63, align 8
  %65 = fmul double %17, %64
  %66 = fsub double %62, %65
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv175, i64 %49
  %68 = load double, double* %67, align 8
  %69 = fmul double %15, %68
  %70 = fsub double %66, %69
  %71 = load double, double* %50, align 8
  %72 = fmul double %15, %71
  %73 = fadd double %16, %72
  %74 = fdiv double %70, %73
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv175, i64 %indvars.iv.lver.orig
  store double %74, double* %75, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, %wide.trip.count
  br i1 %exitcond.lver.orig, label %._crit_edge.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep203 = getelementptr [1000 x double], [1000 x double]* %4, i64 %40, i64 0
  %scevgep206 = getelementptr [1000 x double], [1000 x double]* %5, i64 %40, i64 0
  %load_initial = load double, double* %scevgep203, align 8
  %load_initial207 = load double, double* %scevgep206, align 8
  br label %94

._crit_edge157.us.loopexit:                       ; preds = %.lr.ph156.us
  br label %._crit_edge157.us

._crit_edge157.us:                                ; preds = %._crit_edge157.us.loopexit, %.lr.ph156.us.prol.loopexit, %._crit_edge.us
  %exitcond178 = icmp eq i64 %indvars.iv.next176, %wide.trip.count177
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond178, label %.preheader, label %.lver.check

.lr.ph156.us:                                     ; preds = %.lr.ph156.us.preheader235, %.lr.ph156.us
  %indvars.iv173 = phi i64 [ %indvars.iv.next174.1, %.lr.ph156.us ], [ %indvars.iv173.unr.ph, %.lr.ph156.us.preheader235 ]
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv175, i64 %indvars.iv173
  %77 = load double, double* %76, align 8
  %78 = add nsw i64 %indvars.iv173, 1
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %78, i64 %indvars.iv175
  %80 = load double, double* %79, align 8
  %81 = fmul double %77, %80
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv175, i64 %indvars.iv173
  %83 = load double, double* %82, align 8
  %84 = fadd double %81, %83
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv173, i64 %indvars.iv175
  store double %84, double* %85, align 8
  %indvars.iv.next174 = add nsw i64 %indvars.iv173, -1
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv175, i64 %indvars.iv.next174
  %87 = load double, double* %86, align 8
  %88 = fmul double %87, %84
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv175, i64 %indvars.iv.next174
  %90 = load double, double* %89, align 8
  %91 = fadd double %88, %90
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next174, i64 %indvars.iv175
  store double %91, double* %92, align 8
  %indvars.iv.next174.1 = add nsw i64 %indvars.iv173, -2
  %93 = icmp sgt i64 %indvars.iv.next174, 1
  br i1 %93, label %.lr.ph156.us, label %._crit_edge157.us.loopexit

; <label>:94:                                     ; preds = %94, %.ph
  %store_forwarded208 = phi double [ %load_initial207, %.ph ], [ %114, %94 ]
  %store_forwarded205 = phi double [ %load_initial, %.ph ], [ %97, %94 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %94 ]
  %95 = fmul double %15, %store_forwarded205
  %96 = fadd double %16, %95
  %97 = fdiv double %25, %96
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv175, i64 %indvars.iv
  store double %97, double* %98, align 8
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %48
  %100 = load double, double* %99, align 8
  %101 = fmul double %17, %100
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv175
  %103 = load double, double* %102, align 8
  %104 = fmul double %27, %103
  %105 = fsub double %104, %101
  %106 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next176
  %107 = load double, double* %106, align 8
  %108 = fmul double %17, %107
  %109 = fsub double %105, %108
  %110 = fmul double %15, %store_forwarded208
  %111 = fsub double %109, %110
  %112 = fmul double %15, %store_forwarded205
  %113 = fadd double %16, %112
  %114 = fdiv double %111, %113
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv175, i64 %indvars.iv
  store double %114, double* %115, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit236, label %94

._crit_edge.us.loopexit:                          ; preds = %.ph.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit236:                       ; preds = %94
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit236, %._crit_edge.us.loopexit
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %22, i64 %indvars.iv175
  store double 1.000000e+00, double* %116, align 8
  br i1 %24, label %.lr.ph156.us.preheader, label %._crit_edge157.us

.lr.ph156.us.preheader:                           ; preds = %._crit_edge.us
  br i1 %lcmp.mod, label %.lr.ph156.us.prol.loopexit, label %.lr.ph156.us.prol

.lr.ph156.us.prol:                                ; preds = %.lr.ph156.us.preheader
  %117 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv175, i64 %32
  %118 = load double, double* %117, align 8
  %119 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %35, i64 %indvars.iv175
  %120 = load double, double* %119, align 8
  %121 = fmul double %118, %120
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv175, i64 %32
  %123 = load double, double* %122, align 8
  %124 = fadd double %121, %123
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %32, i64 %indvars.iv175
  store double %124, double* %125, align 8
  br label %.lr.ph156.us.prol.loopexit

.lr.ph156.us.prol.loopexit:                       ; preds = %.lr.ph156.us.prol, %.lr.ph156.us.preheader
  %indvars.iv173.unr.ph = phi i64 [ %indvars.iv.next174.prol, %.lr.ph156.us.prol ], [ %32, %.lr.ph156.us.preheader ]
  br i1 %34, label %._crit_edge157.us, label %.lr.ph156.us.preheader235

.lr.ph156.us.preheader235:                        ; preds = %.lr.ph156.us.prol.loopexit
  br label %.lr.ph156.us

.preheader:                                       ; preds = %._crit_edge157.us
  br i1 %36, label %.lver.check223.preheader, label %._crit_edge170

.lver.check223.preheader:                         ; preds = %.preheader
  br label %.lver.check223

.lver.check223:                                   ; preds = %.lver.check223.preheader, %._crit_edge167.us
  %indvar209 = phi i64 [ %indvar.next210, %._crit_edge167.us ], [ 0, %.lver.check223.preheader ]
  %indvars.iv187 = phi i64 [ %indvars.iv.next188, %._crit_edge167.us ], [ 1, %.lver.check223.preheader ]
  %126 = add i64 %indvar209, 1
  %127 = add i64 %indvar209, 1
  %scevgep211 = getelementptr [1000 x double], [1000 x double]* %4, i64 %127, i64 0
  %scevgep213 = getelementptr [1000 x double], [1000 x double]* %4, i64 %127, i64 %wide.trip.count
  %scevgep215 = getelementptr [1000 x double], [1000 x double]* %5, i64 %127, i64 0
  %scevgep217 = getelementptr [1000 x double], [1000 x double]* %5, i64 %127, i64 %wide.trip.count
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv187
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %128, i64 0, i64 0
  store double 1.000000e+00, double* %129, align 8
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv187, i64 0
  store double 0.000000e+00, double* %130, align 8
  %131 = bitcast [1000 x double]* %128 to i64*
  %132 = load i64, i64* %131, align 8
  %133 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv187
  %134 = bitcast [1000 x double]* %133 to i64*
  store i64 %132, i64* %134, align 8
  %135 = add nsw i64 %indvars.iv187, -1
  %indvars.iv.next188 = add nuw nsw i64 %indvars.iv187, 1
  %bound0219 = icmp ult double* %scevgep211, %scevgep217
  %bound1220 = icmp ult double* %scevgep215, %scevgep213
  %memcheck.conflict222 = and i1 %bound0219, %bound1220
  br i1 %memcheck.conflict222, label %.ph224.lver.orig.preheader, label %.ph224

.ph224.lver.orig.preheader:                       ; preds = %.lver.check223
  br label %.ph224.lver.orig

.ph224.lver.orig:                                 ; preds = %.ph224.lver.orig.preheader, %.ph224.lver.orig
  %indvars.iv179.lver.orig = phi i64 [ %indvars.iv.next180.lver.orig, %.ph224.lver.orig ], [ 1, %.ph224.lver.orig.preheader ]
  %136 = add nsw i64 %indvars.iv179.lver.orig, -1
  %137 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv187, i64 %136
  %138 = load double, double* %137, align 8
  %139 = fmul double %17, %138
  %140 = fadd double %18, %139
  %141 = fdiv double %29, %140
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv187, i64 %indvars.iv179.lver.orig
  store double %141, double* %142, align 8
  %143 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %135, i64 %indvars.iv179.lver.orig
  %144 = load double, double* %143, align 8
  %145 = fmul double %15, %144
  %146 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv187, i64 %indvars.iv179.lver.orig
  %147 = load double, double* %146, align 8
  %148 = fmul double %31, %147
  %149 = fsub double %148, %145
  %150 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next188, i64 %indvars.iv179.lver.orig
  %151 = load double, double* %150, align 8
  %152 = fmul double %15, %151
  %153 = fsub double %149, %152
  %154 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv187, i64 %136
  %155 = load double, double* %154, align 8
  %156 = fmul double %17, %155
  %157 = fsub double %153, %156
  %158 = load double, double* %137, align 8
  %159 = fmul double %17, %158
  %160 = fadd double %18, %159
  %161 = fdiv double %157, %160
  %162 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv187, i64 %indvars.iv179.lver.orig
  store double %161, double* %162, align 8
  %indvars.iv.next180.lver.orig = add nuw nsw i64 %indvars.iv179.lver.orig, 1
  %exitcond182.lver.orig = icmp eq i64 %indvars.iv.next180.lver.orig, %wide.trip.count181
  br i1 %exitcond182.lver.orig, label %._crit_edge163.us.loopexit, label %.ph224.lver.orig

.ph224:                                           ; preds = %.lver.check223
  %scevgep225 = getelementptr [1000 x double], [1000 x double]* %4, i64 %126, i64 0
  %scevgep230 = getelementptr [1000 x double], [1000 x double]* %5, i64 %126, i64 0
  %load_initial226 = load double, double* %scevgep225, align 8
  %load_initial231 = load double, double* %scevgep230, align 8
  br label %181

._crit_edge167.us.loopexit:                       ; preds = %.lr.ph166.us
  br label %._crit_edge167.us

._crit_edge167.us:                                ; preds = %._crit_edge167.us.loopexit, %.lr.ph166.us.prol.loopexit, %._crit_edge163.us
  %exitcond190 = icmp eq i64 %indvars.iv.next188, %wide.trip.count189
  %indvar.next210 = add i64 %indvar209, 1
  br i1 %exitcond190, label %._crit_edge170.loopexit, label %.lver.check223

.lr.ph166.us:                                     ; preds = %.lr.ph166.us.preheader233, %.lr.ph166.us
  %indvars.iv183 = phi i64 [ %indvars.iv.next184.1, %.lr.ph166.us ], [ %indvars.iv183.unr.ph, %.lr.ph166.us.preheader233 ]
  %163 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv187, i64 %indvars.iv183
  %164 = load double, double* %163, align 8
  %165 = add nsw i64 %indvars.iv183, 1
  %166 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv187, i64 %165
  %167 = load double, double* %166, align 8
  %168 = fmul double %164, %167
  %169 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv187, i64 %indvars.iv183
  %170 = load double, double* %169, align 8
  %171 = fadd double %168, %170
  %172 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv187, i64 %indvars.iv183
  store double %171, double* %172, align 8
  %indvars.iv.next184 = add nsw i64 %indvars.iv183, -1
  %173 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv187, i64 %indvars.iv.next184
  %174 = load double, double* %173, align 8
  %175 = fmul double %174, %171
  %176 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv187, i64 %indvars.iv.next184
  %177 = load double, double* %176, align 8
  %178 = fadd double %175, %177
  %179 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv187, i64 %indvars.iv.next184
  store double %178, double* %179, align 8
  %indvars.iv.next184.1 = add nsw i64 %indvars.iv183, -2
  %180 = icmp sgt i64 %indvars.iv.next184, 1
  br i1 %180, label %.lr.ph166.us, label %._crit_edge167.us.loopexit

; <label>:181:                                    ; preds = %181, %.ph224
  %store_forwarded232 = phi double [ %load_initial231, %.ph224 ], [ %201, %181 ]
  %store_forwarded229 = phi double [ %load_initial226, %.ph224 ], [ %184, %181 ]
  %indvars.iv179 = phi i64 [ 1, %.ph224 ], [ %indvars.iv.next180, %181 ]
  %182 = fmul double %17, %store_forwarded229
  %183 = fadd double %18, %182
  %184 = fdiv double %29, %183
  %185 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv187, i64 %indvars.iv179
  store double %184, double* %185, align 8
  %186 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %135, i64 %indvars.iv179
  %187 = load double, double* %186, align 8
  %188 = fmul double %15, %187
  %189 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv187, i64 %indvars.iv179
  %190 = load double, double* %189, align 8
  %191 = fmul double %31, %190
  %192 = fsub double %191, %188
  %193 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next188, i64 %indvars.iv179
  %194 = load double, double* %193, align 8
  %195 = fmul double %15, %194
  %196 = fsub double %192, %195
  %197 = fmul double %17, %store_forwarded232
  %198 = fsub double %196, %197
  %199 = fmul double %17, %store_forwarded229
  %200 = fadd double %18, %199
  %201 = fdiv double %198, %200
  %202 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv187, i64 %indvars.iv179
  store double %201, double* %202, align 8
  %indvars.iv.next180 = add nuw nsw i64 %indvars.iv179, 1
  %exitcond182 = icmp eq i64 %indvars.iv.next180, %wide.trip.count181
  br i1 %exitcond182, label %._crit_edge163.us.loopexit234, label %181

._crit_edge163.us.loopexit:                       ; preds = %.ph224.lver.orig
  br label %._crit_edge163.us

._crit_edge163.us.loopexit234:                    ; preds = %181
  br label %._crit_edge163.us

._crit_edge163.us:                                ; preds = %._crit_edge163.us.loopexit234, %._crit_edge163.us.loopexit
  %203 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv187, i64 %37
  store double 1.000000e+00, double* %203, align 8
  br i1 %28, label %.lr.ph166.us.preheader, label %._crit_edge167.us

.lr.ph166.us.preheader:                           ; preds = %._crit_edge163.us
  br i1 %lcmp.mod186, label %.lr.ph166.us.prol.loopexit, label %.lr.ph166.us.prol

.lr.ph166.us.prol:                                ; preds = %.lr.ph166.us.preheader
  %204 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv187, i64 %32
  %205 = load double, double* %204, align 8
  %206 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv187, i64 %39
  %207 = load double, double* %206, align 8
  %208 = fmul double %205, %207
  %209 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv187, i64 %32
  %210 = load double, double* %209, align 8
  %211 = fadd double %208, %210
  %212 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv187, i64 %32
  store double %211, double* %212, align 8
  br label %.lr.ph166.us.prol.loopexit

.lr.ph166.us.prol.loopexit:                       ; preds = %.lr.ph166.us.prol, %.lr.ph166.us.preheader
  %indvars.iv183.unr.ph = phi i64 [ %indvars.iv.next184.prol, %.lr.ph166.us.prol ], [ %32, %.lr.ph166.us.preheader ]
  br i1 %38, label %._crit_edge167.us, label %.lr.ph166.us.preheader233

.lr.ph166.us.preheader233:                        ; preds = %.lr.ph166.us.prol.loopexit
  br label %.lr.ph166.us

._crit_edge170.loopexit:                          ; preds = %._crit_edge167.us
  br label %._crit_edge170

._crit_edge170:                                   ; preds = %._crit_edge170.loopexit, %.preheader152, %.preheader
  %213 = add nuw nsw i32 %.0171, 1
  %exitcond191 = icmp eq i32 %.0171, %0
  br i1 %exitcond191, label %._crit_edge172.loopexit, label %.preheader152

._crit_edge172.loopexit:                          ; preds = %._crit_edge170
  br label %._crit_edge172

._crit_edge172:                                   ; preds = %._crit_edge172.loopexit, %6
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge13

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count16 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv14, %8
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count16
  br i1 %exitcond17, label %._crit_edge13.loopexit, label %.preheader.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
